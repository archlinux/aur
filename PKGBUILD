# Maintainer: Mike Williamson <mike at korora dot ca>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb
pkgver=3.1.1
pkgrel=1
pkgdesc="A multi-model NoSQL database, combining key-value, document and graph data models."
arch=("i686" "x86_64" "armv7l" "armv7h")
url="https://www.arangodb.com/"
license=('APACHE')
depends=("glibc" "gcc-libs" "openssl" "systemd")
makedepends=("cmake" "binutils" "python2")
provides=("arangodb=$pkgver")
conflicts=("arangodb-latest" "arangodb-git")
options=()
install=arangodb.install
source=("https://www.arangodb.com/repositories/Source/ArangoDB-$pkgver.tar.bz2"
"arangodb.service" "arangodb-tmpfile.conf")
sha256sums=('a6c3479ce1a6af5acbc417360bc219b66b0aba9fe98b66b7920d26ac9f0d07e9'
            '40ccbb4034aedaa0d2b1d2922d0d9e53271dfa024f421105a988e1f65f1eef51'
            '736581ab917755c859d17b4015f68380384f924279aa61c9c160960018e1e4e4')

build() {
  msg2 "Symlinking 'python' to python2."
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"
  export LD="ld.gold"

  msg2 "Configuring ArangoDB."
  cd $srcdir/ArangoDB-$pkgver
  [ -d build ] || mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-O3 -fno-omit-frame-pointer" \
    -DCMAKE_CXX_FLAGS="-O3 -fno-omit-frame-pointer" \
    -DVARDIR=/var \
    -DETCDIR=/etc \
    -DVARDIR=/var \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_DATADIR:PATH=/usr/share \
    -DCMAKE_SKIP_RPATH:BOOL=ON \
    ..
  msg2 "Building ArangoDB."
  make -j $(nproc)
}

package() {
  msg2 "Preparing ArangoDB."
  mkdir -p $pkgdir/usr/libexec/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/build/etc $pkgdir
  cp -R $srcdir/ArangoDB-$pkgver/build/var $pkgdir
  cp -R $srcdir/ArangoDB-$pkgver/build/bin $pkgdir/usr
  cp -R $srcdir/ArangoDB-$pkgver/build/lib $pkgdir/usr
  mkdir -p $pkgdir/usr/share/arangodb3/js
  mkdir -p $pkgdir/usr/share/man
  cp -R $srcdir/ArangoDB-$pkgver/js/* $pkgdir/usr/share/arangodb3/js
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/man/* $pkgdir/usr/share/man

  install -Dm644 arangodb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/arangodb.conf

  msg2 "Preparing systemd service."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/
}
