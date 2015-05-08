# Maintainer: Mike Williamson <mike at korora dot ca>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb
pkgver=2.5.3
pkgrel=1
pkgdesc="A multi-model NoSQL database, combining key-value, document and graph data models."
arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=('APACHE')
depends=("glibc" "gcc-libs" "openssl" "readline" "systemd" "v8" "libev" "icu")
makedepends=("python2 go>=1.4")
provides=("arangodb=$pkgver")
conflicts=("arangodb-latest" "arangodb-git")
backup=()
options=()
install=arangodb.install
source=("https://www.arangodb.com/repositories/Source/$pkgname-$pkgver.tar.bz2" "arangodb.service")
sha256sums=('43119a5962cd788f2edc613f3daa449612bd47452e5c51965c8f92e88cf9a268'
            'd7e23bdff47355e5225cec30a94ec9012e8096f117b66c0c45202bf9aee480a3')

build() {
  msg2 "Symlinking 'python' to python2."
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"

  # TODO find out what good flags for production are.
  export CFLAGS="-g -O2"
  export CXXFLAGS="-g -O2"

  msg2 "Configuring ArangoDB."
  cd $srcdir/ArangoDB-$pkgver
  make setup
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-all-in-one-etcd

  msg2 "Building ArangoDB."
  make -j $(nproc)
}

package() {
  msg2 "Preparing ArangoDB."
  cd $srcdir/ArangoDB-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/* $pkgdir/usr/share/doc/arangodb/

  msg2 "Preparing systemd service."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/
}

check() {
  cd $srcdir/ArangoDB-$pkgver
  make -k check
}

