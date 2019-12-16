# Maintainer: Mike Williamson <mike at korora dot ca>

pkgname=arangodb
pkgver=3.5.3
pkgrel=1
pkgdesc="A multi-model NoSQL database, combining key-value, document and graph data models."
arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=("APACHE")
depends=("openssl" "systemd" "curl" "zlib")
makedepends=("cmake" "python2" "linux-api-headers")
options=()
install=arangodb.install
source=("https://download.arangodb.com/Source/ArangoDB-$pkgver.tar.bz2"
"https://download.arangodb.com/Source/ArangoDB-${pkgver}.tar.bz2.asc"
"arangodb3.service"
"arangodb-tmpfile.conf"
"arangodb-users.conf")
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha512sums=('d5f26c6c10e3e2bed04c977761f567e160a6ecbb92bc56ba9e063b61785e8a86630c74a911cf7334b0a55b8878992ea08be6fcffc1eff1369d27c690d159e045'
            'SKIP'
            '5afb8b1b611e81dc5a5e0d74ba4e781d41f0404c24ae327fd55481a23669ef1acc7bf90a1dd1eda8b86476fe1ac3cb287c39e50820d610f041f029ad36ae82ca'
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
    -DCMAKE_INSTALL_PREFIX:PATH=/ \
    -DCMAKE_SKIP_RPATH=On \
    ..
  msg2 "Building ArangoDB."
  make
}

package() {
  msg2 "Preparing ArangoDB."
  mkdir -p $pkgdir/usr/bin
  cp -R $srcdir/ArangoDB-$pkgver/build/etc $pkgdir
  cp $srcdir/ArangoDB-$pkgver/build/bin/arango* $pkgdir/usr/bin/
  cp $srcdir/ArangoDB-$pkgver/build/bin/foxx* $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/arangodb3/js
  mkdir -p $pkgdir/usr/share/man
  cp -R $srcdir/ArangoDB-$pkgver/js/* $pkgdir/usr/share/arangodb3/js
  cp -R $srcdir/ArangoDB-$pkgver/build/Documentation/man/* $pkgdir/usr/share/man

  install -dm755 -o arangodb -g arangodb $pkgdir/var/lib/arangodb3
  install -dm755 -o arangodb -g arangodb $pkgdir/var/lib/arangodb3-apps

  install -D -m644 $srcdir/ArangoDB-$pkgver/build/bin/icudtl.dat "$pkgdir"/usr/share/arangodb3/icudtl.dat
  install -D -m644 arangodb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/arangodb.conf
  install -D -m644 $srcdir/ArangoDB-"$pkgver"/Installation/logrotate.d/arangod.systemd "$pkgdir"/etc/logrotate.d/arangodb3
  install -D -m644 $srcdir/ArangoDB-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/arangodb3/LICENSE"

  msg2 "Preparing systemd service."
  install -Dm644 $srcdir/arangodb3.service $pkgdir/usr/lib/systemd/system/arangodb3.service
}
