# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Yardena Cohen <yardenack at gmail dot com>

_pkgname=php-ssh
pkgname=${_pkgname}-git
pkgver=r269.5c08a92
pkgrel=3
pkgdesc="An SSH2 extension for PHP"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php>=7.0.0' 'libssh2')
makedepends=('git')
provides=('php-ssh')
conflicts=('php-ssh')
install=${_pkgname}.install
backup=("etc/php/conf.d/ssh2.ini")
source=("${pkgname}::git+https://github.com/php/pecl-networking-ssh2.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${pkgname}"
  phpize
  ./configure --prefix=/usr --with-ssh2
  make clean
  make
}

# # To run tests, set TEST_SSH2_HOSTNAME and TEST_SSH2_AUTH
# check() {
#     cd "${srcdir}/${pkgname}"
#     NO_INTERACTION=1 make test
# }

package() {
  cd "${srcdir}/${pkgname}"
  make install INSTALL_ROOT="${pkgdir}/"

  echo ';extension=ssh2.so' > ssh2.ini
  install -Dm644 ssh2.ini "${pkgdir}/etc/php/conf.d/ssh2.ini"
}
