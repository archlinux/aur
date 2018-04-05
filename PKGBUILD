# Maintainer: Mike Williamson <mike at korora dot ca>

pkgname=arangodb
pkgver=3.3.5
pkgrel=1
pkgdesc="A multi-model NoSQL database, combining key-value, document and graph data models."
arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=("APACHE")
depends=("openssl" "systemd" "curl" "zlib")
makedepends=("cmake" "clang" "python2" "linux-api-headers")
options=()
install=arangodb.install
source=("https://www.arangodb.com/repositories/Source/ArangoDB-$pkgver.tar.bz2"
"https://www.arangodb.com/repositories/Source/ArangoDB-${pkgver}.tar.bz2.asc"
"arangodb3.service"
"arangodb-tmpfile.conf"
"arangodb-users.conf")
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha512sums=('847a2e3befc5c19b1636d8be3d3528ca97a4002d931e9214508a580893abb9ab14bde89d7b3a4d47f2bf0b2ff3cf3c15a7adf126dfb00d7e53eb0cc9de9b9d63'
            'SKIP'
            '18bccbc960555c600c86409a89545c1c056dbce9abcd5724cd61c54a734d9c974df0d01b0a49c1859299ffc448c3e576f8c2bcc6134ad3f5062293b11cf85091'
            'b1fdf8cc0525d1fc093d02b24b18a1d8361fb2cd8274974269957ef8074a26eb4f2174bdd4abd41154d535df43cd9d553c1b8205cd5945e53674d25dfa3c533f'
            '8a73da7dfb9cc371ce7c72efd53afc04ede26a890cd7542c82c518bf3d7c5be38abfcad66235fc9cf9d63c9955ebcdbca4c1d7056b386b1b59bf61dc1887febd')

build() {
  msg2 "Symlinking 'python' to python2."
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"
  export LD="ld.gold"
  # I'm not proud of this but currently it's the only way to compile this.
  export CC="clang"
  export CXX="clang++"

  msg2 "Configuring ArangoDB."
  cd $srcdir/ArangoDB-$pkgver
  [ -d build ] || mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-O2 -fno-omit-frame-pointer" \
    -DCMAKE_CXX_FLAGS="-O2 -fno-omit-frame-pointer" \
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
  mkdir -p $pkgdir/var/lib/arangodb3
  mkdir -p $pkgdir/var/lib/arangodb3-apps
  mkdir -p $pkgdir/var/log/arangodb3
  cp -R $srcdir/ArangoDB-$pkgver/js/* $pkgdir/usr/share/arangodb3/js
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/man/* $pkgdir/usr/share/man

  install -Dm644 arangodb-users.conf "$pkgdir"/usr/lib/sysusers.d/arangodb.conf
  install -Dm644 arangodb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/arangodb.conf
  install -Dm644 $srcdir/ArangoDB-"$pkgver"/Installation/logrotate.d/arangod.systemd "$pkgdir"/etc/logrotate.d/arangodb3
  install -D -m644 $srcdir/ArangoDB-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/arangodb3/LICENSE"

  msg2 "Preparing systemd service."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb3.service $pkgdir/usr/lib/systemd/system/
}
