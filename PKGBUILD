# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-git
pkgver=3.1.r788.g697663a2
pkgrel=1
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('alsa-lib' 'freetype2' 'libpng' 'openal' 'qt6-base' 'rtmidi' 'sdl2')
makedepends=('git' 'cmake>=3.16' 'qt6-tools')
optdepends=('86box-roms-git: ROM files')
source=(
    "${pkgname}::git+https://github.com/86Box/86Box.git"
    '86box'
    '86Box.desktop'
)
sha256sums=(
    'SKIP'
    'ade8f9fdb9aa69409f0131c419bf2589984519dfbb6d926da05d4d24233b5c3c'
    '457ddcfeb28fcc1688c94bb604ab65d1a6a2ea8e797e8bb5d100c372933b6b7c'
)
provides=('86box')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S"${pkgname}" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DRELEASE=on -DUSE_QT6=on
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm755 86box "$pkgdir/usr/bin"
    install -Dm644 86Box.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/src/win/assets/86Box-green.png" "$pkgdir/usr/share/pixmaps/86Box.png"
}
