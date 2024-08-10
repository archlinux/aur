# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="paramotopy"
_pkgname="${_name}-docs"
pkgname="${_pkgname}-git"
pkgver=1.0.3.7.r15.48174f3
_commit="36121881a137cf29c7f662bd792a0e823d5742f2"
pkgrel=1
pkgdesc="HTML documentation for Paramotopy"
arch=('any')
url="https://paramotopy.com"
_url="https://github.com/ofloveandhate/paramotopy"
license=('custom:Paramotopy license')
makedepends=('git' 'doxygen' 'plantuml' 'graphviz')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen "${_name}.doxy.config"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "examples" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${_name}/{}" \;
  
  cd "documentation"
  install -Dm644 "source/paramotopy_manual.pdf" "${pkgdir}/usr/share/doc/paramotopy/MANUAL.pdf"
  
  cd "generated_documentation/doc.${_name}.com"
  install -d "${pkgdir}/usr/share/doc/${_name}/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/html/{}" \;
  rm -f "${pkgdir}/usr/share/doc/${_name}/html/.gitignore"
}
