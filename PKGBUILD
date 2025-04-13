# Maintainer: Application-Maker <Application-Maker.Uinwad@erine.email>
# Contributor: Jenya Sovetkin <e dot sovetkin at gmail dot com>
# Contributor: @xnor
# Contributor: @nicolasvila
# Contributor: @xer01ne

pkgname=shellinabox-git
pkgver=r431.4f0ecc3
pkgrel=2
pkgdesc="Implementation of a web server that can export arbitrary command line tools to a web based terminal emulator"
arch=('any')
url="https://github.com/shellinabox/shellinabox"
license=('GPL2')
depends=('pam' 'openssl')
makedepends=('git' 'gcc' 'autoconf' 'automake')
backup=('usr/lib/systemd/system/shellinabox.service')
source=('shellinabox.service'
        'git+https://github.com/shellinabox/shellinabox')
md5sums=('68a3c15b359151eea27432142a80207a'
         'SKIP')

_gitname=shellinabox

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  autoreconf -i
  ./configure --prefix=/usr LDFLAGS="-lssl -lcrypto"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "${srcdir}/shellinabox.service"  "${pkgdir}/usr/lib/systemd/system/shellinabox.service"
}
