# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-sha3
pkgver=20150506.2.1902def
pkgrel=1
pkgdesc="PHP extension that implements SHA-3 (Keccak)"
url="https://github.com/strawbrary/php-sha3"
license="MIT"
arch=('i686' 'x86_64')
depends=('php')
makedepends=('git')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/strawbrary/${pkgname}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "$(date +"%Y%m%d").$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/${pkgname}"
  phpize
  ./configure --enable-sha3
  make
  NO_INTERACTION=1 make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/php/conf.d"

  echo "extension=sha3.so" > "sha3.ini"
  install -Dm644 sha3.ini "${pkgdir}/etc/php/conf.d/sha3.ini"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
