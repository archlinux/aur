# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=shellinabox-git
pkgver=r428.98e6eeb
pkgrel=1
pkgdesc="Implementation of a web server that can export arbitrary command line tools to a web based terminal emulator"
arch=('any')
url="https://github.com/shellinabox/shellinabox"
license=('GPL2')
depends=('pam' 'openssl')
makedepends=('git' 'gcc' 'autoconf' 'automake')
backup=('usr/lib/systemd/system/shellinabox@.service')
source=('shellinabox@.service'
        'git+https://github.com/shellinabox/shellinabox')
md5sums=('9778d64973cd9dd7cf2225cd9af0cd09'
         'SKIP')

_gitname=shellinabox

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_gitname}"

  autoreconf -i

  export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/}"
  ./configure  --prefix=/usr
  make

  make DESTDIR="$pkgdir/" install
  install -Dm655 "${srcdir}/shellinabox@.service"  "${pkgdir}/usr/lib/systemd/system/shellinabox@.service"
}

# vim:set ts=2 sw=2 et:
