# Maintainer: Christoph Grabo <asaaki at mannaz dot cc>
# Contributor: Christoph Grabo <asaaki at mannaz dot cc>

pkgname=arangodb
pkgver=2.6.2
pkgrel=1

pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
license=("Apache")
url="https://www.arangodb.com/"

provides=("arangodb=$pkgver")
conflicts=("arangodb-git")
depends=("glibc" "gcc-libs" "openssl" "readline" "systemd" "icu")
makedepends=("python2" "go>=1.4")

arch=("i686" "x86_64")

install=arangodb.install
source=( "https://www.arangodb.com/repositories/Source/ArangoDB-${pkgver}.tar.bz2"
         'arangodb.service')
sha256sums=('230de07979a81388edce9ca668d11ac0d567b8435085793e216bc48bacff46e2'
            '8b244e30c69dac28c12fa080b4ee7c4256977e8a8a6ffa342432ae48e35a9b12')

build() {
  msg2 "Python2 link"
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"

  msg2 "Configure ArangoDB project ..."
  cd $srcdir/ArangoDB-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-mruby

  msg2 "Build ArangoDB project ..."
  make
}

check() {
  cd $srcdir/ArangoDB-$pkgver
  make -k check
}

package() {
  msg2 "Prepare ArangoDB installation ..."
  cd $srcdir/ArangoDB-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/* $pkgdir/usr/share/doc/arangodb/

  msg2 "Prepare systemd service setup ..."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/

  msg2 "Done!"
}
