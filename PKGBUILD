pkgname=mbedtls-git
pkgver=2.3.0.r156.g184eea6
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl - git checkout"
arch=('i686' 'x86_64')
url="https://tls.mbed.org"
license=('Apache')
provides=('polarssl' 'mbedtls')
replaces=('polarssl')
conflicts=('polarssl' 'mbedtls')
source=("git://github.com/ARMmbed/mbedtls")
sha256sums=('SKIP')
depends=('glibc')
options=('staticlibs')

pkgver() {
	cd mbedtls/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count development).g$(git log -1 --format="%h")"
	fi
}

prepare() {
  cd mbedtls/
  # enable flags for non-embedded systems
  sed -i 's|//\(#define MBEDTLS_THREADING_C\)|\1|' include/mbedtls/config.h
  sed -i 's|//\(#define MBEDTLS_THREADING_PTHREAD\)|\1|' include/mbedtls/config.h
  # fix OpenVPN compilation
  for f in $( find include/mbedtls -type f ); do
	sed -i '1s|^|#define\ mbedtls_time_t\ time_t\n|' $f
  done
}

build() {
  cd mbedtls/
  LDFLAGS+=" -I../include " make SHARED=1 no_test
}

check() {
  cd mbedtls/
  make SHARED=1 check
}

package() {
  cd mbedtls/
  make DESTDIR="$pkgdir/usr" install
}
