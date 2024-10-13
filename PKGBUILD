# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="itex2mml"
pkgname="${_pkgname}-bzr"
pkgver=r85
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1')
depends=('gcc-libs' 'glibc')
makedepends=('bzr')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::bzr+https://golem.ph.utexas.edu/~distler/code/itexToMML")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${_pkgsrc}/itex-src"
  sed -i "s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
  sed -i "s/\$(CXX) \$(CFLAGS)/ \$(CXX) ${CFLAGS} ${LDFLAGS}/" Makefile
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  
  cd "itex-src"
  install -d "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
