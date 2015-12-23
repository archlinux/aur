pkgname=fastd-git
arch=(i686 x86_64)
pkgver=v17.r84.0358cbf
pkgrel=1
pkgdesc="Fast and secure tunneling daemon (git version)"

# Enable for fast AES implementations
ENABLE_OPENSSL=0

makedepends=('git' 'cmake' 'bison' 'pkg-config')
depends=('libcap' 'gcc-libs' 'libuecc>=6' 'libsodium' 'json-c')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://git.universe-factory.net/fastd')
md5sums=('SKIP')

[ $ENABLE_OPENSSL -eq 0 ] || depends=(${depends[@]} 'openssl')

license=('BSD')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  mkdir -p "$srcdir/build-${pkgver}"
  cd "$srcdir/build-${pkgver}"

  opts=''
  [ $ENABLE_OPENSSL -eq 0 ] || opts="${opts} -D ENABLE_OPENSSL=ON"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr -D ENABLE_SYSTEMD=ON -D ENABLE_LTO=ON ${opts} "../${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/build-${pkgver}"
  make install DESTDIR="${pkgdir}"

  install -dm755 "${pkgdir}/etc/fastd/"

  install -Dm644  "$srcdir/${pkgname%-git}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname%-git}/COPYRIGHT"
  install -Dm644 "$srcdir/${pkgname%-git}/doc/examples/fastd@.service" "${pkgdir}/usr/lib/systemd/system/fastd@.service"
  install -Dm644 "$srcdir/${pkgname%-git}/doc/fastd.1" "${pkgdir}/usr/share/man/man1/fastd.1"
}
