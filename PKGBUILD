# Maintainer: Kleshzz <vasyapulopapik@gmail.com>

pkgname=amp-player
_pkgname=amp
pkgver=0.1
pkgrel=1
pkgdesc='A Music Player'
arch=('x86_64')
url='https://codeberg.org/alichraghi/amp'
license=('GPL-3.0-only')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'vulkan-icd-loader'
  'wayland'
  'libxkbcommon'
  'libx11'
  'libxcursor'
  'libxrandr'
  'libxi'
  'libxinerama'
  'libxext'
  'libxrender'
)
optdepends=(
  'vulkan-driver: Vulkan driver (mesa, nvidia-utils, ...)'
  'pipewire: PipeWire audio backend'
  'alsa-lib: ALSA audio backend (fallback)'
  'libdecor: window decorations on Wayland'
)
makedepends=('zig>=0.17.1' 'zig<0.18')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('564c2dffcb8c3d75d0f93aacc47f6c64a656b29f0797bc377f2b39c095d07895')

_target='native-linux.6.1-gnu.2.38'

prepare() {
    cd "$_pkgname"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    local i
    for i in 1 2 3 4 5; do
        zig build --help -Dtarget="$_target" > /dev/null && return 0
        echo "fetch failed, retry $i/5" >&2
        sleep 5
    done
    return 1
}

build() {
  cd "$_pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  DESTDIR="$PWD/build" zig build \
    --summary all \
    --system "$PWD/zig-pkg" \
    --prefix /usr \
    --release=safe \
    -Dtarget="$_target" \
    -Dcpu=baseline
}

package() {
  cd "$_pkgname"
  cp -a build/* "$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
