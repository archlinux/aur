# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-git
pkgver=3.1.r212.gb764f828
pkgrel=1
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('freetype2' 'sdl2' 'libpng' 'openal' 'alsa-lib' 'rtmidi')
makedepends=('git' 'cmake>=3.15')
optdepends=('86box-roms-git: ROM files')
source=("${pkgname}::git+https://github.com/86Box/86Box.git" '86Box.desktop')
sha256sums=('SKIP' 'a7a62cfd0ab1088406879a15245d1a9c9ef1e6d69d72e9d63ed3da14b8d298ac')
provides=('86box')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S"${pkgname}" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DRELEASE=on
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm644 86Box.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$pkgname/src/win/assets/86Box-green.png" "$pkgdir/usr/share/pixmaps/86Box.png"
}
