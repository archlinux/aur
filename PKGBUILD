# Maintainer: oscareczek <at gmail dot com>
pkgname=86box
_pkgname=86Box
pkgver=3.11
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('hicolor-icon-theme' 'libslirp' 'openal' 'qt5-base' 'rtmidi' 'sdl2')
makedepends=('cmake>=3.21' 'extra-cmake-modules' 'ninja' 'qt5-tools' 'vulkan-headers') # vulkan-headers on qt5
optdepends=(
    '86box-roms: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
options=('!buildflags')
source=(
    "https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('4705f0bb7186a19b8a74450132a73c01e9fae80809e7cebf2ef0294100081ff6a27e0f81dbc661596a8d1cd7b04afc5dddb3e990dd10951a37a48de338c49a77')

build() {
    case "$CARCH" in
        pentium4) _NDR=off; _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _NDR=off; _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    LDFLAGS='-z now' cmake -S"$_pkgname-$pkgver" -Bbuild --preset regular --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DNEW_DYNAREC="$_NDR" -DSLIRP_EXTERNAL=on
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    for i in 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512; do
        install -Dm644 "$srcdir/$_pkgname-$pkgver/src/unix/assets/$i/net.86box.86Box.png" -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
    done
    mkdir "$pkgdir/usr/share/applications"
    sed 's/^Exec.*/Exec=86Box -P .local\/share\/86Box/' "$srcdir/$_pkgname-$pkgver/src/unix/assets/net.86box.86Box.desktop" > "$pkgdir/usr/share/applications/net.86box.86Box.desktop"
}
