# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

_gitname='libsigrok'
pkgname="${_gitname}-git"
pkgver=0.2.1.r1719.geb2373f
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi-compat' 'alsa-lib' 'libserialport-git' 'glibmm')
makedepends=('git' 'autoconf-archive')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/${_gitname}.//" ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr --disable-java --disable-python

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm 644 'contrib/z60_libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
}

# vim:set et sw=2 sts=2 tw=80: