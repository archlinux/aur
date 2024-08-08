# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paramotopy-docs"
pkgname="${_pkgname}-git"
pkgver=1.0.3.7.r444.48174f3
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
  local rev_count=$(git rev-list --count HEAD)
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
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
