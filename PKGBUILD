# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: afontenot <adam.m.fontenot@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=mozjpeg
pkgver=4.1.5
pkgrel=1
pkgdesc="Improved JPEG encoder"
url="https://github.com/mozilla/mozjpeg"
license=("BSD-3-Clause-Modification" "IJG" "Zlib")
arch=("i686" "x86_64" "armv7h")
depends=("libpng")
makedepends=("nasm" "cmake")
provides=("libjpeg" "libjpeg.so" "turbojpeg" "libjpeg-turbo")
conflicts=("libjpeg" "mozjpeg-git" "turbojpeg" "libjpeg-turbo")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9fcbb7171f6ac383f5b391175d6fb3acde5e64c4c4727274eade84ed0998fcc1')

build() {
  cd mozjpeg-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DENABLE_STATIC=FALSE \
  -DPNG_SUPPORTED=TRUE -DWITH_JPEG8=TRUE .
  make
}

# There are a lot of tests: if you don't want to run them, you or
# your AUR helper should use `makepkg --nocheck`.
check() {
  cd mozjpeg-$pkgver
  make test ||:
}

package() {
  cd mozjpeg-$pkgver
  make \
        DESTDIR="$pkgdir" \
        docdir="/usr/share/doc/mozjpeg" \
        exampledir="/usr/share/doc/mozjpeg" \
        install
  install -D LICENSE.md "$pkgdir/usr/share/licenses/mozjpeg/LICENSE"
  install -m644 jpegint.h "$pkgdir/usr/include"
}
