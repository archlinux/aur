# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="itex2mml"
pkgname="${_pkgname}-bzr"
pkgver=r85
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version')
makedepends=('bzr')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::bzr+https://golem.ph.utexas.edu/~distler/code/itexToMML"
        "${_pkgname}_fix_makefile.patch")
noextract=("${_pkgsrc}.tar.gz")
sha256sums=('SKIP'
            '88905ddf2aa4add02ba100afa71b209f1f9eae51e26239b1590de7b4df407c75')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${_pkgsrc}/itex-src"
  sed -i "s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
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
