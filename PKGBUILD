# Maintainer: AndreaFrederica <andreafrederica@outlook.com>
pkgname=lunalauncher-git
pkgver=11.0.2.r11406.g9176c13fb
pkgrel=1
pkgdesc='A custom Minecraft launcher based on Prism Launcher (git build with bundled YukariConnect)'
arch=('x86_64')
url='https://github.com/AndreaFrederica/LunaLauncher'
license=('GPL-3.0-or-later')
options=('!debug' '!lto')
depends=(
  'gamemode'
  'hicolor-icon-theme'
  'java-runtime>=8'
  'libarchive'
  'libwebp'         # 捆绑的 libqwebp.so 插件在运行期链接它
  'qrencode'
  'qt6-base'
  'qt6-multimedia'
  'qt6-networkauth'
  'qt6-svg'
  'qt6-websockets'
  'tomlplusplus'
  'zlib'
)
makedepends=(
  'aspnet-targeting-pack>=10.0' # YukariConnect 引用 Microsoft.AspNetCore.App 框架
  'clang'           # YukariConnect NativeAOT 发布需要
  'cmake'           # meson 以 cmake 方式探测 Qt6
  'dotnet-sdk>=10.0' # YukariConnect 子项目构建（面向 .NET 10）
  # Arch 的 dotnet-sdk 依赖不带版本号，会被 dotnet-runtime-8.0 等旧版
  # 的 versioned provides 冒充满足，必须显式钉住 10.x 的运行时与目标包。
  'dotnet-runtime>=10.0'
  'dotnet-targeting-pack>=10.0'
  'git'
  'jdk21-openjdk'   # 上游 Pixi 固定 openjdk 21；JDK 26+ 已移除 java.applet，旧版 MC applet 代码无法编译
  'meson'
  'ninja'
  'pkgconf'
  'qt6-imageformats' # 构建期拷贝 webp 插件进安装目录
)
provides=('lunalauncher')
conflicts=('lunalauncher')
source=('git+https://github.com/AndreaFrederica/LunaLauncher.git')
sha256sums=('SKIP')

pkgver() {
  cd LunaLauncher
  local version rev_count short_hash
  version=$(sed -n "s/^[[:space:]]*version: '\([^']*\)'.*/\1/p" meson.build | head -n1)
  rev_count=$(git rev-list --count HEAD)
  short_hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s\n' "$version" "$rev_count" "$short_hash"
}

prepare() {
  cd LunaLauncher
  git submodule update --init --recursive
  # 预取 YukariConnect wrap 子项目，保证 build() 阶段无需访问 git 远端。
  # 注意：dotnet publish 仍需联网还原 NuGet 包，本包不支持离线 chroot 构建。
  meson subprojects download yukariconnect
}

build() {
  # qtpaths6 位于 /usr/lib/qt6/bin（不在 PATH 中），通过上游预留的环境变量
  # 直接指定 Qt 插件目录，跳过 meson 的 find_program 探测。
  export LUNA_QT_PLUGIN_DIR="$(/usr/lib/qt6/bin/qtpaths6 --query QT_INSTALL_PLUGINS)"

  # 强制使用 JDK 21 的 javac，避免系统默认 JDK（26+，已移除 java.applet）被选中。
  export PATH="/usr/lib/jvm/java-21-openjdk/bin:$PATH"

  meson setup build LunaLauncher --prefix=/usr --buildtype=release \
    -Dbuild_testing=false \
    -Dbuild_yukari_connect=true \
    -Dbuild_pcl_download=false \
    -Dneo_ui=disabled \
    -Dyggdrasil=disabled \
    -Dcurseforge_webview=disabled \
    -Dgamemode=enabled
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
