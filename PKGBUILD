# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

_gitname='libsigrok'
pkgname="${_gitname}-git"
pkgver=0.2.1.r3429.g02a8c07d
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi' 'alsa-lib' 'libserialport-git' 'glibmm' 'libieee1284')
makedepends=('git' 'autoconf-archive' 'doxygen')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}"
)
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --exclude 'libsigrok-unreleased' --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/${_gitname}"
  ./autogen.sh

  cd "${srcdir}/build"
  echo "CONFIGURE"
  ../${_gitname}/configure --prefix=/usr --disable-java --disable-ruby

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd ../"${_gitname}"
  install -Dm 644 'contrib/60-libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
  install -Dm 644 'contrib/61-libsigrok-uaccess.rules' "${pkgdir}/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules"
}
