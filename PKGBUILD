# Maintainer: Pulshen Sudokamikaze <pulshencode@outlook.com>

_pkgbasename=caps
pkgname=lib32-${_pkgbasename}
pkgver=0.9.24
pkgrel=2
pkgdesc="The C* Audio Plugin Suite (32 bit)"
arch=('x86_64')
url="http://quitte.de/dsp/caps.html"
license=('GPL3')
groups=('ladspa-plugins')
depends=('lib32-gcc-libs' 'lib32-ladspa')
optdepends=('python2: optional CFLAGS check')
source=(http://quitte.de/dsp/${_pkgbasename}_${pkgver}.tar.bz2
	'lib32_caps.patch'
	'0001-Avoid-ambiguity-in-div-invocation.patch')
sha256sums=('SKIP'
	'0c57f76795f9a69c042cf750c229fd1e2011c64b56416184949e422da9257037'
	'5e71875dd8976efede46a3e0aa08ccf14a25a838454e1ae2473c4eed7c5937ac')

prepare() {
	cd $_pkgbasename-$pkgver
	# use a minimum of optimization required to build
	export _CFLAGS='-msse -mfpmath=sse'
}


build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  type -p python2 1>/dev/null && python2 configure.py
  patch < "${srcdir}/lib32_caps.patch"
	patch < "${srcdir}/0001-Avoid-ambiguity-in-div-invocation.patch"
  make
 }

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  install -v -m 0755 -D caps.so ${pkgdir}/usr/lib32/ladspa/caps.so
}
