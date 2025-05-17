# Maintainer: fuel <melodygoad18 at gmail dot com>
# Contributor: Legacy Installer <contact dot legacyinstaller at gmail dot com>
# Contributor: oscareczek <oscareczek at gmail dot com>
pkgname=pcbox-git
pkgver=r14275.86b6d80
pkgrel=1
pkgdesc='An emulator for classic IBM PC clones (Built with qt6)'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://pcbox-emu.xyz/'
license=('GPL2')
depends=('fluidsynth' 'hicolor-icon-theme' 'libslirp' 'openal' 'qt6-base' 'rtmidi' 'sdl2' # explicit
'freetype2' 'gcc-libs' 'glib2' 'glibc' 'libevdev' 'libglvnd' 'libpng' 'libx11' 'libxcb' 'libxext' 'libxi' 'libxkbcommon-x11' 'libxkbcommon' 'wayland' 'zlib') # implicit
makedepends=('git' 'cmake>=3.21' 'extra-cmake-modules' 'ninja' 'qt6-tools' 'vde2' 'vulkan-headers')
optdepends=(
    'pcbox-roms-git: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
provides=('86box')
conflicts=(
    '86box'
    '86box-git'
    '86box-qt5-git'
    'pcbox-qt5-git'
)
options=('!buildflags')
source=("${pkgname}::git+https://github.com/PCBox/PCBox.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    case "$CARCH" in
        pentium4) _NDR=off; _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _NDR=off; _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _NDR=on;  _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    LDFLAGS='-z now' cmake -S"${pkgname}" -Bbuild --preset regular --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=on -DNEW_DYNAREC="$_NDR"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    for i in 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512; do
        install -Dm644 "$srcdir/$pkgname/src/unix/assets/$i/net.86box.86Box.png" -t "$pkgdir/usr/share/icons/hicolor/$i/apps"
    done
    mkdir "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/src/unix/assets/net.86box.86Box.desktop" "$pkgdir/share/applications/net.pcbox.PCBox.desktop"
    sed -i 's#Name=86Box#Name=PCBox#g' "$pkgdir/share/applications/net.pcbox.PCBox.desktop"
    sed -i 's#Exec=86Box#Exec=PCBox -P .local/share/PCBox#g' "$pkgdir/share/applications/net.pcbox.PCBox.desktop"
}
