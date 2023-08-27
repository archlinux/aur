# Maintainer: Lili1228 <aur at gramywpsl dot pl>
pkgname=86box
_pkgname=86Box
pkgver=4.0
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('fluidsynth' 'hicolor-icon-theme' 'libslirp' 'openal' 'qt6-base' 'rtmidi' 'sdl2' # explicit
'freetype2' 'gcc-libs' 'glib2' 'glibc' 'libevdev' 'libglvnd' 'libpng' 'libx11' 'libxcb' 'libxext' 'libxi' 'libxkbcommon-x11' 'libxkbcommon' 'wayland' 'zlib') # implicit 
makedepends=('cmake>=3.21' 'extra-cmake-modules' 'ninja' 'qt6-tools' 'vde2') # vulkan-headers on qt5
optdepends=(
    '86box-roms: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
options=('!buildflags')
source=(
    "86Box.tgz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('8465e86e44bb5fa260f0550479e877a0f4a407eb59a00db8bab6764fecb292b8c9a370451eb71adbf84db990d7ea70e001cd1b2bc096c95caa7526901d20833e')

build() {
    case "$CARCH" in
        pentium4) _NDR=off; _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _NDR=off; _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    LDFLAGS='-z now' cmake -S"$_pkgname-$pkgver" -Bbuild --preset regular --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=on -DNEW_DYNAREC="$_NDR"
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
