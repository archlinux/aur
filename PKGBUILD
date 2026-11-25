# Maintainer: JohnChiao <johnchiao@outlook.com>
pkgname=touchfish-client
pkgver=0.5.1
pkgrel=1
pkgdesc='TouchFish V5 official modern chat client, built with Flutter'
arch=('x86_64' 'aarch64')
url='https://github.com/ILoveScratch2/TouchFish-Client'
license=('AGPL-3.0-only')
depends=(
  'gtk3'
  'libepoxy'
  'libsecret'
  'alsa-lib'
  'libpulse'
  'libayatana-appindicator'
  'mpv'
)
makedepends=(
  'clang'
  'lld'
  'cmake'
  'ninja'
  'pkgconf'
  'git'
  'unzip'
  'patchelf'
  # 源码只在 material 库中引用 CupertinoPageTransitionsBuilder；
  # Flutter 3.44 起该类仅由 cupertino 库导出，编译必须限制上界。
  'flutter>=3.38'
  'flutter<3.44'
)
optdepends=(
  'ffmpeg: 语音消息编码（record 插件调用 ffmpeg）'
  'xdg-utils: 打开外部文件/链接（open_file 插件调用 xdg-open）'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('14a3e10525077ca2992a4e4630c8534076f9e0c3b8c4870e0ee070f348522b8a'
            '8da683679ac63941e32264aef68925fa2390d12cf20c1d91163683ff9eb9de90')

_upstream='TouchFish-Client'
_appid='ci.us.ilovescratch.touchfish.astra.v3.touchfish_client'
_bin='touchfish_client'
_bundle_arch='x64'
[[ $CARCH == 'aarch64' ]] && _bundle_arch='arm64'

prepare() {
  cd "$_upstream-$pkgver"

  # 上游 linux/CMakeLists.txt 给全部插件统一加 -Wall -Werror；clang 23 新启用的
  # -Wunused-but-set-global 命中 flutter_webrtc/common/cpp，构建直接中断。
  # 沿用上游自己处理 appindicator 废弃警告的方式，把它降级为警告。
  sed -i 's/-Wno-error=deprecated-declarations/-Wno-error=deprecated-declarations -Wno-error=unused-but-set-global/' \
    linux/CMakeLists.txt

  # pub 缓存放在任务目录，避免写入 ~/.pub-cache；依赖需联网获取。
  export PUB_CACHE="$srcdir/pub-cache"
  flutter pub get
}

build() {
  cd "$_upstream-$pkgver"

  export PUB_CACHE="$srcdir/pub-cache"
  # jni 插件（path_provider_android 带入）在 Linux 无用：无 JDK 时 CMake 直接跳过
  # 该目标，有 JDK 则生成 libdartjni.so 并把 libjvm.so 写进 NEEDED（未声明的运行时依赖）。
  unset JAVA_HOME
  flutter build linux --release --no-pub
}

check() {
  cd "$_upstream-$pkgver"

  export PUB_CACHE="$srcdir/pub-cache"
  flutter test
}

package() {
  cd "$_upstream-$pkgver"

  # 程序主体：Flutter bundle（RPATH 为 $ORIGIN/lib，必须整目录保留）
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -a "build/linux/$_bundle_arch/release/bundle/." "$pkgdir/usr/lib/$pkgname/"

  # 插件 .so 的 RUNPATH 里写死了构建目录（…/linux/flutter/ephemeral 等），
  # makepkg 会据此报 "Package contains reference to $srcdir"，且运行时该路径已不存在。
  # 统一收敛为 $ORIGIN（插件与依赖库同处 lib/），与上游给主程序设的 rpath 一致。
  find "$pkgdir/usr/lib/$pkgname/lib" -name '*.so' -print0 |
    while IFS= read -r -d '' so; do
      [[ $(patchelf --print-rpath "$so") == '$ORIGIN' ]] ||
        patchelf --set-rpath '$ORIGIN' "$so"
    done

  # /usr/bin 入口（$ORIGIN 按真实可执行文件解析，符号链接安全）
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$_bin" "$pkgdir/usr/bin/$pkgname"

  # 图标：与 .desktop 的 Icon= 对应
  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # 许可证：程序本体 + 内置 HarmonyOS Sans 字体（各自独立授权）
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/font/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.font"

  # 桌面入口：文件名与 GTK application-id 对齐，Wayland/X11 才能正确归类窗口
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_appid.desktop"
}
