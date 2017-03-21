# Maintainer: Mike Williamson <mike at korora dot ca>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb
pkgver=3.1.14
pkgrel=4
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
"https://www.arangodb.com/repositories/Source/ArangoDB-${pkgver}.tar.bz2.asc"
"arangodb3.service"
"arangodb-tmpfile.conf"
"arangodb-users.conf")
validpgpkeys=('CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B') # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha512sums=('09a33af07af28b457a01d9281314d0dcb99f0ef646068a70d2fa62bad98a85fc5264e518ac62f320bbef503c1ad259d13beb24cdbc7bd498f02a095c089e4989'
            'SKIP'
            '57a88d2250fb7db6d423338d9a8ecf7c8e315b876f99cc17c6a90cb414a4a69d6654d8dfe697e9ae174c525bb1757bc184bfd62d3dfa15f95b8a9a4a80808fd3'
            '4dc6f0a18be2e759b89693a54f3376f52d8b646978c81f0f7069d8ed2c6d7123777a9709d000a5467a4f927b8befb5f472d933eb843db842cf853321a0ad5e7c'
            '8a73da7dfb9cc371ce7c72efd53afc04ede26a890cd7542c82c518bf3d7c5be38abfcad66235fc9cf9d63c9955ebcdbca4c1d7056b386b1b59bf61dc1887febd')

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
    -DCMAKE_INSTALL_PREFIX:PATH=/ \
    -DCMAKE_SKIP_RPATH=On \
    ..
  msg2 "Building ArangoDB."
  make -j $(nproc)
}

package() {
  msg2 "Preparing ArangoDB."
  mkdir -p $pkgdir/usr/bin
  cp -R $srcdir/ArangoDB-$pkgver/build/etc $pkgdir
  cp -R $srcdir/ArangoDB-$pkgver/build/var $pkgdir
  cp -R $srcdir/ArangoDB-$pkgver/build/bin/* $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/arangodb3/js
  mkdir -p $pkgdir/usr/share/man
  cp -R $srcdir/ArangoDB-$pkgver/js/* $pkgdir/usr/share/arangodb3/js
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/man/* $pkgdir/usr/share/man

  install -Dm644 arangodb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/arangodb.conf
  install -Dm644 arangodb-users.conf "$pkgdir"/usr/lib/sysusers.d/arangodb.conf
  install -D -m644 $srcdir/ArangoDB-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/arangodb3/LICENSE"

  msg2 "Preparing systemd service."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb3.service $pkgdir/usr/lib/systemd/system/
}
