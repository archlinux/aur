# Maintainer: oscareczek <at gmail dot com>
pkgname=86box
_pkgname=86Box
pkgver=3.7.1
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('hicolor-icon-theme' 'libslirp' 'openal' 'qt6-base' 'rtmidi' 'sdl2')
makedepends=('cmake>=3.21' 'ninja' 'qt6-tools')
optdepends=(
    '86box-roms: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
options=('!buildflags')
source=(
    "https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('38abe254ea24eb6430eb87eca517bf7b318188df0f0f6d6dec5a04fefac143d591cea303398b7179fe72dc80cd0393778f9c64012b6183a6c8a6e615d40340e7')

build() {
    case "$CARCH" in
        pentium4) _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    LDFLAGS='-z now' cmake -S"$_pkgname-$pkgver" -Bbuild --preset "$_PRESET" --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=on -DSLIRP_EXTERNAL=on
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
