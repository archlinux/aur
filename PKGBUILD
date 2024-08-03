# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paramotopy-docs"
pkgname="${_pkgname}-git"
pkgver=r444.48174f3
pkgrel=1
pkgdesc="HTML documentation for Paramotopy"
arch=('any')
url="https://paramotopy.com"
_url="https://github.com/ofloveandhate/paramotopy"
license=('custom:Paramotopy license')
makedepends=('git' 'doxygen' 'plantuml' 'graphviz')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="paramotopy"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen paramotopy.doxy.config
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "examples" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/paramotopy/{}" \;
  
  cd "documentation"
  install -Dm644 "source/paramotopy_manual.pdf" "${pkgdir}/usr/share/doc/paramotopy/paramotopy_manual.pdf"
  
  cd "generated_documentation"
  install -d "${pkgdir}/usr/share/doc/paramotopy/html"
  find "doc.paramotopy.com" -mindepth 1 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/paramotopy/html/" \;
  rm -f "${pkgdir}/usr/share/doc/paramotopy/html/.gitignore"
}
