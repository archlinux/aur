pkgname=fastd
arch=(i686 x86_64)
pkgver=17
pkgrel=1
pkgdesc="Fast and secure tunneling daemon"

# Enable for fast AES implementations
ENABLE_OPENSSL=0

makedepends=('cmake' 'bison' 'pkg-config')
depends=('libcap' 'gcc-libs' 'libuecc>=5' 'libsodium' 'json-c')

[ $ENABLE_OPENSSL -eq 0 ] || depends=(${depends[@]} 'openssl')

url="https://projects.universe-factory.net/projects/fastd"
license=('BSD')
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --insecure -o %o %u')
source=("https://projects.universe-factory.net/attachments/download/81/${pkgname}-${pkgver}.tar.xz")
sha512sums=('6bdf5df1d75c462d52a8709718c183dfe173b5d56a4c29592d4cbb4c35f9f31efa900bb575490384b878a421e1d197454036b39d9b93154b6ae8c876f30f30c2')

build() {
  mkdir -p "$srcdir/build-${pkgver}"
  cd "$srcdir/build-${pkgver}"

  opts=''
  [ $ENABLE_OPENSSL -eq 0 ] || opts="${opts} -D ENABLE_OPENSSL=ON"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr -D ENABLE_SYSTEMD=ON -D ENABLE_LTO=ON ${opts} "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/build-${pkgver}"
  make install DESTDIR="${pkgdir}"

  install -dm755 "${pkgdir}/etc/fastd/"

  install -Dm644  "$srcdir/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/doc/examples/fastd@.service" "${pkgdir}/usr/lib/systemd/system/fastd@.service"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/doc/fastd.1" "${pkgdir}/usr/share/man/man1/fastd.1"
}
