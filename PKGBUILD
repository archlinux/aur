# Maintainer: Mike Williamson <mike at korora dot ca>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb
pkgver=3.1.15
pkgrel=2
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
sha512sums=('46e8764fa949e7ade7d1e3d2707c49313b7cdc3b687f94807901ead4fd3b543c8980b2f1a75f09e0e27b73fcb4e9af63e24d115404861728269ff4e4ccbf831d'
            'SKIP'
            '18bccbc960555c600c86409a89545c1c056dbce9abcd5724cd61c54a734d9c974df0d01b0a49c1859299ffc448c3e576f8c2bcc6134ad3f5062293b11cf85091'
            'b1fdf8cc0525d1fc093d02b24b18a1d8361fb2cd8274974269957ef8074a26eb4f2174bdd4abd41154d535df43cd9d553c1b8205cd5945e53674d25dfa3c533f'
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
