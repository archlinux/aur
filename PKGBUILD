# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=dico
pkgver=2.10
pkgrel=1
pkgdesc="GNU Dictionary Server"
arch=('x86_64')
url="http://puszcza.gnu.org.ua/software/$pkgname"
license=(GPL3)
depends=(python gsasl wordnet-common guile pam)
source=("ftp://download.gnu.org.ua/pub/release/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig}
        'Fix-compilation-with-python-38-newer.patch')
sha1sums=('e1bffaf6c9b913a97cc1f5916d1a6a6fd7b605ee'
          'SKIP'
          'b11709a95d2136f149a263b1ce758b5f6c8490aa')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')
   # Sergey Poznyakoff <gray@gnu.org>
   # To validate, see instructions at:
   #   https://puszcza.gnu.org.ua/software/dico/download.html

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir/Fix-compilation-with-python-38-newer.patch"
  ./bootstrap --modules
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/dico \
    --sysconfdir=/etc \
    --with-pcre \
    --with-wordnet
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
