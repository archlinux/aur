# Maintainer: Mahmud Ridwan <m[at]hjr265[dot]me>
pkgname=ibus-avro-git
pkgver=20150925
pkgrel=1
pkgdesc="Avro Phonetic Bangla typing for Linux"
url="http://linux.omicronlab.com"
arch=('x86_64' 'i686')
license=('MPL')
depends=('ibus' 'gjs')
makedepends=('autoconf' 'automake')
install=$pkgname.install

build() {
  cd "$srcdir"

  if [ -e $pkgname ]; then
    cd $pkgname
    git pull
    git checkout develop
  else
    git clone -b develop git://github.com/sarim/ibus-avro.git $pkgname
    cd $pkgname
  fi

  aclocal || return 1
  autoconf || return 1

  automake --add-missing
  ./configure --prefix=/usr

  make || return 1
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" installdeb
  install -Dm644 MPL-1.1.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  sed -i 's|<layout>bn</layout>|<layout>us</layout>|' "$pkgdir/usr/share/ibus/component/ibus-avro.xml"

  rmdir "$pkgdir/usr/libexec"
}
