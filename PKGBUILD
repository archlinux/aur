# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="paramotopy-docs"
pkgver=1.0.3.7
_commit="36121881a137cf29c7f662bd792a0e823d5742f2"
pkgrel=1
pkgdesc="HTML documentation for Paramotopy"
arch=('any')
url="https://paramotopy.com"
_url="https://github.com/ofloveandhate/paramotopy"
license=('custom:Paramotopy license')
makedepends=('doxygen' 'plantuml' 'graphviz')
provides=("${pkgname}")
conflicts=("${pkgname}")
_pkgsrc="paramotopy-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('4f04d932c540d68d69d2d8605699921c4e98227016999056b8afbe5d630ca54a')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen paramotopy.doxy.config
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "examples" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/paramotopy/{}" \;
  
  cd "documentation"
  install -Dm644 "source/paramotopy_manual.pdf" "${pkgdir}/usr/share/doc/paramotopy/MANUAL.pdf"
  
  cd "generated_documentation/doc.paramotopy.com"
  install -d "${pkgdir}/usr/share/doc/paramotopy/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/paramotopy/html/{}" \;
  rm -f "${pkgdir}/usr/share/doc/paramotopy/html/.gitignore"
}
