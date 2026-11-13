# Maintainer: zhiyuxl <zhiyuxl@outlook.com>
#
# Yati 是自包含打包的：CEF 的 C++ 包装层（libcef_dll_wrapper）必须与 libcef.so 同版本
# 编译，而仓库 extra/cef 只提供头文件与 .so、不含包装层源码。因此这里直接取官方
# 分发包固定版本，装到 /usr/lib/yati 下，不受 extra/cef 升级影响。

pkgname=yati
pkgver=0.2.0
pkgrel=1
pkgdesc='用 HTML/CSS/JS 写桌面应用，内核是 CEF（Chromium）'
arch=('x86_64')
url='https://github.com/zhiyuHD/Yati'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'libcups'
  'libdrm' 'libffi' 'libpulse' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
  'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango'
  'systemd-libs'
  # Chromium 156 的媒体/编码相关运行时依赖
  'brotli' 'dav1d' 'double-conversion' 'flac' 'freetype2' 'harfbuzz' 'highway'
  'libjpeg-turbo' 'libwebp' 'libxml2' 'libxslt' 'minizip' 'openh264' 'opus' 'zstd'
)
makedepends=('cmake' 'ninja')
# CEF 的包装层 220 个编译单元 + 1.4 GB 的 libcef.so，LTO 没有收益且显著拖慢构建
options=('!lto')
optdepends=(
  'wl-clipboard: 剪贴板读写（Wayland）'
  'xclip: 剪贴板读写（X11）'
  'libnotify: 系统通知（notify-send）'
  'xdg-utils: 打开外部链接、在文件管理器中显示'
)

# GitHub 的归档目录名沿用仓库名大小写（Yati-0.2.0），不是 pkgname
_srcdir="Yati-$pkgver"
_cefver='156.0.28+g57389f0+chromium-156.0.8078.88'
_cefdir="cef_binary_${_cefver}_linux64_minimal"
# 下载 URL 里的 '+' 必须转成 %2B，否则会被当作空格
_cefurl="https://cef-builds.spotifycdn.com/cef_binary_${_cefver//+/%2B}_linux64_minimal.tar.bz2"

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/zhiyuHD/Yati/archive/v$pkgver.tar.gz"
  "cef.tar.bz2::$_cefurl"
)
sha256sums=(
  '53234d89be5a07797e279b0c133be413c206ca0275fee796b6390050cf85d90c'
  '7b53123d0628fce62c755c090b0ae52b454431d98b53b8d99fb505757f48f43a'
)

prepare() {
  # CEF 的构建脚本把警告当错误（-Werror），而 Arch 的硬化参数（-Wp,-D_FORTIFY_SOURCE=3
  # 等）会引入它没预料到的告警，直接编译失败。这里只摘掉 -Werror，
  # 不改任何优化或安全选项。
  sed -i -E 's/^([[:space:]]*)-Werror([[:space:]]|$)/\1# -Werror\2/' \
    "$srcdir/$_cefdir/cmake/cef_variables.cmake"

  # 项目自带的 CMake 会去 vendor/cef/ 下自动探测分发包；这里把它放成那个布局，
  # 走的就是上游 README 描述的同一条构建路径。
  mkdir -p "$srcdir/$_srcdir/vendor/cef"
  ln -sfn "$srcdir/$_cefdir" "$srcdir/$_srcdir/vendor/cef/$_cefdir"
}

build() {
  # CEF 包装层把 __FILE__ 编译进了二进制（日志/断言用），会带上 $srcdir 绝对路径。
  # 按 Arch 惯例映射到 /usr/src/debug，既消除路径泄露，也保留调试定位。
  export CFLAGS="${CFLAGS} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"

  cmake -S "$_srcdir" -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MAKE_PROGRAM=ninja \
    -DCEF_ROOT="$srcdir/$_cefdir"
  cmake --build build --parallel
}

package() {
  # 运行期文件必须和可执行文件同目录：rpath 是 $ORIGIN，CEF 也按 exe 相对路径找资源。
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a --dereference build/bin/. "$pkgdir/usr/lib/$pkgname/"

  # 启动器：显式走沙箱（Arch 默认允许非特权 user namespace）
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/$pkgname --sandbox "\$@"
EOF

  install -Dm644 "$srcdir/$_srcdir/assets/yati.desktop" \
    "$pkgdir/usr/share/applications/yati.desktop"
  install -Dm644 "$srcdir/$_srcdir/assets/yati.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/yati.svg"
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
