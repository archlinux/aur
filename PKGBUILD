# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=man2texi
pkgver=0.01
pkgrel=5
pkgdesc="Converts well-structured man pages to Texinfo format"
arch=('i686' 'x86_64')
url="http://www.math.utah.edu/pub/man2texi/"
depends=('gawk' 'bash')
license=('GPL')
source=("$url/$pkgname-$pkgver.tar.bz2" noiso8859.diff)
sha256sums=('9aacf76bd4c7454387474daca31aef27d5b7fbbeb41a0ad72b2e3974a8213a67'
            '816e0472b9f4ea1828de013c9ef85fed3f7255cdc79b2cef954b03d8e47ca497')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man/man1 

  make SHRLIBDIR=/usr/share/$pkgname
  patch $pkgname.sh "$srcdir"/noiso8859.diff
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.man "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 $pkgname.awk \
    "$pkgdir"/usr/share/$pkgname/$pkgname.awk
  sed -i 's+\/usr\/local\/bin+\/bin+' \
    "$pkgdir"/usr/share/$pkgname/$pkgname.awk
  sed -i 's+SHRLIBDIR=.+SHRLIBDIR=/usr/share/man2texi+' \
    "$pkgdir"/usr/bin/$pkgname
}

