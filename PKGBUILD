# Maintainer: Mike Williamson <mike at korora dot ca>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb
pkgver=3.0.0
pkgrel=1
pkgdesc="A multi-model NoSQL database, combining key-value, document and graph data models."
arch=("i686" "x86_64" "armv7l" "armv7h")
url="https://www.arangodb.com/"
license=('APACHE')
depends=("glibc" "gcc-libs" "openssl" "readline" "systemd")
makedepends=("cmake binutils python2 go")
provides=("arangodb=$pkgver")
conflicts=("arangodb-latest" "arangodb-git")
options=()
install=arangodb.install
source=("https://www.arangodb.com/repositories/Source/ArangoDB-$pkgver.tar.bz2" "arangodb.service")
sha256sums=('9a543b421e914dd5f8ff6a16514d8509d12ed085255ba935ef150c290f9ccf05'
            'ccde74e481761e2879845a0c9fbef601f4cdd73465d425549d3ad6714e99443d')

build() {
  msg2 "Symlinking 'python' to python2."
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"
  export LD="ld.gold"

  msg2 "Configuring ArangoDB."
  mv $srcdir/ArangoDB-$pkgver $srcdir/arangodb
  cd $srcdir/arangodb
  [ -d build ] || mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ..
  msg2 "Building ArangoDB."
  make -j $(nproc)
}

package() {
  msg2 "Preparing ArangoDB."
  mkdir -p $pkgdir/usr/libexec/arangodb
  cp -R $srcdir/arangodb/build/etc $pkgdir
  cp -R $srcdir/arangodb/build/var $pkgdir
  cp -R $srcdir/arangodb/build/bin $pkgdir/usr
  cp -R $srcdir/arangodb/build/lib $pkgdir/usr
  mkdir -p $pkgdir/usr/share/doc/arangodb
  mkdir -p $pkgdir/usr/share/arangodb/js
  cp -R $srcdir/arangodb/js/* $pkgdir/usr/share/arangodb/js
  cp -R $srcdir/arangodb/Documentation/* $pkgdir/usr/share/doc/arangodb/

  msg2 "Preparing systemd service."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/
}
