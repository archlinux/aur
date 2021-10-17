# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-git
pkgver=r5776.bd9b6766
pkgrel=1
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('i686' 'x86_64')
url='https://86box.net/'
license=('GPL2')
depends=('freetype2' 'sdl2' 'libpng' 'openal' 'alsa-lib')
makedepends=('git' 'cmake>=3.15' 'ffmpeg')
optdepends=('86box-roms-git: ROM files')
source=("${pkgname}::git+https://github.com/86Box/86Box.git" '86box.desktop')
sha256sums=('SKIP' '45b69e5663065130439ae615a98e3eab8a526e97964133956cdc71a500e42945')
provides=('86box')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S"${pkgname}" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DRELEASE=on -DUSB=on
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    mkdir -p "$pkgdir/usr/share/pixmaps" "$pkgdir/usr/share/applications"
    ffmpeg -i "$srcdir/$pkgname/src/win/icons/86Box.ico" "$pkgdir/usr/share/pixmaps/86box.png"
    chmod 644 "$pkgdir/usr/share/pixmaps/86box.png"
    install -Dm644 86box.desktop "$pkgdir/usr/share/applications"
}
