# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

_gitname='libsigrok'
pkgname="${_gitname}-git"
pkgver=0.2.1.r3425.gf6129c8f
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
	"file://0001-doxyfile-work-around-doxygen-1.8.16-bug.patch"
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --exclude 'libsigrok-unreleased' --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	patch -Np1 <../0001-doxyfile-work-around-doxygen-1.8.16-bug.patch
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/${_gitname}"
  ./autogen.sh

  cd "${srcdir}/build"
  ../${_gitname}/configure --prefix=/usr --disable-java

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd ../"${_gitname}"
  install -Dm 644 'contrib/60-libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
  install -Dm 644 'contrib/61-libsigrok-uaccess.rules' "${pkgdir}/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules"
}
