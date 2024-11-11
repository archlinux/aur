# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-haru
_project=gawkextlib
pkgver=1.0.2
pkgrel=6
pkgdesc="GAWK extension - interface to the libharu PDF library"
arch=('x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'glibc' 'libharu')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz"
        fix-build.patch)
md5sums=('a2e5a2f3dfe2a49460719e1fe485d45d'
         '72ec160c9ab0fde4682d2f67618ea166')
sha256sums=('92fb8d83b71de2fe2aec0bc2468459e728290e0c675ca8c19aaf195ba3cad9b6'
            '9f533f9215c27955122075ccd37dadafa864e47cc5a6b782d62cf592baac461c')

prepare() {
  cd "$pkgname-$pkgver"
  # Ports the code to work with newer libharu
  patch -p1 -i "$srcdir"/fix-build.patch
  # Temporary workaround to allow the extension to build (with warnings). These
  # warnings are issued because the code has yet to be ported to the Gawk 5
  # API.
  sed -i 's/\(.*do_HPDF.*(.*, awk_value_t \*result\))$/\1, struct awk_ext_func *unused)/' pdf.c
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
