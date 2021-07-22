#Maintainer: Sanskrit Coders <sanskrit-programmers@googlegroups.com>
# Much of the file is copied from https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/m17n-db
pkgname=m17n-db-indic
pkgname_basic=m17n-db
pkgver=1.8.0
pkgrel=2
pkgdesc='A library to type in a variety of scripts. This is a fork of m17n-db modified with files from m17n-db for convenience of Indian (esp. sanskrit, kannada) users (see url).'
license=('GPL')
provides=("${pkgname_basic}")
conflicts=("${pkgname_basic}")
depends=('glibc') # not because of compiling, but because of /usr/share/i18n/charmaps/ files that glibc provides
makedepends=('git')
source=("https://download.savannah.gnu.org/releases/m17n/${pkgname_basic}-${pkgver}.tar.gz")
sha256sums=('657f23835b6655e7a63a362bac66260454ee356da4855eadb9366911d33fdc6d')
url="http://github.com/indic-transliteration/m17n-db-indic-aur"
# license=('custom:OFL')
arch=(any)

build() {
  rm -rf "$srcdir/m17n-db-indic/"
  git clone https://github.com/indic-transliteration/m17n-db-indic.git

  cd ${pkgname_basic}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname_basic}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # Drop script that makes UIM segfault http://savannah.nongnu.org/bugs/index.php?53202
  rm "$pkgdir"/usr/share/m17n/hu-rovas-post.mim
    
  cd "$srcdir/m17n-db-indic/"
  cp -f "$srcdir/m17n-db-indic/"*.mim "$pkgdir/usr/share/m17n/"
  cp -rf "$srcdir/m17n-db-indic/icons" "$pkgdir/usr/share/m17n/"
}
