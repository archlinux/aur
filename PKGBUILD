# Maintainer: CPPlayer <在此填你的 AUR 用户名 / 邮箱>
#
# 由 CI 自动更新：`.github/workflows/desktop-release.yml` 的 aur job 在每次 stable
# 发布后 clone AUR 仓库、重写本文件的 pkgver / pkgrel / url / source / sha256sums
# 五行、重新生成 .SRCINFO 并 push。**其余内容**（依赖、package()、desktop 条目等）
# 改本仓库里的这份模板即可，CI 会原样带上去。
#
# 产物布局：应用主体装进 /opt/CPPlayer，不内置 JBR 运行时；
# /opt/CPPlayer/lib/runtime 软链接至系统 /usr/lib/jvm/jbr25（由依赖包 jbr25 提供）。
# /usr/bin/cpplayer 是跳板脚本（exec /opt/CPPlayer/bin/CPPlayer "$@"）。
# 对应布局：
#   CPPlayer/bin/CPPlayer          启动器
#   CPPlayer/lib/app/*.jar         应用字节码与依赖
#   CPPlayer/lib/runtime           软链接至 /usr/lib/jvm/jbr25
#   CPPlayer/lib/CPPlayer.png 等   图标（jpackage 放置）

pkgname=cpplayer-bin
pkgver=1.8.8
pkgrel=1
pkgdesc="Cross-platform music player (Material 3 Expressive) - prebuilt binaries"
arch=('x86_64')
url="https://github.com/Aurora-Nasa-1/CPPlayer-KMP"
# 仓库目前没有 LICENSE 文件：先用 LicenseRef-UNLICENSED 占位。
# 上游加了 LICENSE 后，把这里改成对应 SPDX 标识（MIT / GPL-3.0-or-later ...）。
license=('LicenseRef-UNLICENSED')
# AUR 分发流不包含自带 JBR，依赖系统/AUR 安装的 jbr25 运行时（提供 Java 25、原生 WindowMove 与高效 GC）；
# 其余为运行时动态链接的系统库：
# alsa-lib —— rodio/CPAL 播放走 ALSA；fontconfig/X11 组 —— AWT/Skiko 窗口与字体。
depends=('jbr25' 'alsa-lib' 'fontconfig' 'libx11' 'libxext' 'libxrender' 'libxtst' 'libxi')
provides=('cpplayer')
conflicts=('cpplayer')
# ⚠️ 下面这行被 CI 的 sed 整行重写（url、下载地址、真实 sha256）；
# 手工构建时先跑 `updpkgsums`（或 `makepkg -g`）把 SKIP 换成真实哈希。
source=("CPPlayer-${pkgver}-linux-x64.tar.gz::https://github.com/Aurora-Nasa-1/CPPlayer-KMP/releases/download/v1.8.8/CPPlayer-1.8.8-linux-x64.tar.gz")
sha256sums=('68b6dee288e51a4837d66d4fa17e1bb36b2454917baa480499b2ec9abe42472e')

package() {
  # 应用本体进 /opt（与 google-chrome / jetbrains-toolbox 类似）。
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/CPPlayer" "${pkgdir}/opt/CPPlayer"

  # AUR 分发流不内置 JBR 运行时：剥离自带的 lib/runtime 目录，软链接至系统 jbr25
  rm -rf "${pkgdir}/opt/CPPlayer/lib/runtime"
  ln -s /usr/lib/jvm/jbr25 "${pkgdir}/opt/CPPlayer/lib/runtime"

  # tar.gz 正常情况下已带 755；这里是最后一道保险，防止权限位在传输中丢失。
  chmod 755 "${pkgdir}/opt/CPPlayer/bin/CPPlayer"

  # 跳板脚本而不是软链：jpackage 启动器按自身真实路径找 ../lib/<名>.cfg，
  # 经 sh -c exec 调用不受 /usr/bin 下符号链接解析的影响。
  # 启动前校验 jbr25 运行时的存在性，提供清晰的用户报错。
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/cpplayer" <<'LAUNCHER'
#!/bin/sh
if [ ! -d "/opt/CPPlayer/lib/runtime" ]; then
  echo "Error: JetBrains Runtime 25 not found at /usr/lib/jvm/jbr25" >&2
  echo "Please ensure the 'jbr25' package is installed on your system: pacman -S jbr25" >&2
  exit 1
fi
exec /opt/CPPlayer/bin/CPPlayer "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/cpplayer"

  # 桌面图标：jpackage 的 Linux 应用镜像把图标放在 lib/<应用名>.png，
  # 这里不猜死文件名，取 lib 下第一张 png（找不到就跳过，不影响启动）。
  _icon="$(find "${pkgdir}/opt/CPPlayer/lib" -maxdepth 1 -name '*.png' -print -quit 2>/dev/null || true)"
  if [ -n "${_icon}" ]; then
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/cpplayer.png"
  fi

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cpplayer.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=CPPlayer
GenericName=Music Player
Comment=Cross-platform music player (Material 3 Expressive)
Exec=/usr/bin/cpplayer %U
Icon=cpplayer
Categories=AudioVideo;Audio;Music;Player;
Terminal=false
DESKTOP
}
