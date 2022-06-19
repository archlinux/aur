# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-git
pkgver=3.5.r56.g51f8cb363
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('faudio' 'libslirp' 'qt6-base' 'rtmidi')
makedepends=('git' 'cmake>=3.21' 'ninja' 'qt6-tools')
optdepends=(
    '86box-roms-git: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
provides=('86box')
conflicts=('86box')
options=('!buildflags')
source=("${pkgname}::git+https://github.com/86Box/86Box.git")
sha512sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    case "$CARCH" in
        pentium4) _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    LDFLAGS='-z now' cmake -S"${pkgname}" -Bbuild --preset "$_PRESET" --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=on -DSLIRP_EXTERNAL=on 
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    for i in 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512; do
        install -Dm644 "$srcdir/$pkgname/src/unix/assets/$i/net.86box.86Box.png" -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
    done
    mkdir "$pkgdir/usr/share/applications"
    sed 's/^Exec.*/Exec=86Box -P .local\/share\/86Box/' "$srcdir/$pkgname/src/unix/assets/net.86box.86Box.desktop" > "$pkgdir/usr/share/applications/net.86box.86Box.desktop"
}
