# Maintainer:  Neng Xu <neng2.xu2@gmail.com>
# Contributor: asaaki
pkgname=arangodb-git
pkgver=p20140814
pkgrel=1
pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
provides=("arangodb")
conflicts=("arangodb")

arch=("i686" "x86_64")
url="http://www.arangodb.org"
license=("Apache")
depends=("openssl" "bash" "systemd" "icu")
makedepends=("python2" "git" "go")
install=arangodb.install
source=("git://github.com/arangodb/arangodb:master"
  "arangodb.service")
md5sums=("SKIP"
  "ccb8ede90277b4f78493c0466a797348")

pkgver() {
  cd arangodb
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd arangodb
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"
  #./configure --bindir=/usr/bin --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --datarootdir=/usr/share
  #make setup
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd arangodb
  make -k check
}

package() {
  cd arangodb
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R Documentation/* $pkgdir/usr/share/doc/arangodb/
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp ../arangodb.service $pkgdir/usr/lib/systemd/system/
  rm -rf $pkgdir/usr/share/doc/arangodb/man*
}
