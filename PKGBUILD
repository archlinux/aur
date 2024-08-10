# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
_pkgname="${_name}-docs"
pkgname="${_pkgname}-git"
pkgver=1.6.1.r278.58a8faa
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="XHTML documentation for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
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
  local version=$(sed -n 's/AC_INIT(\[bertini_real\],\[\([^]]*\)\],.*/\1/p' "configure.ac")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen "${_name}.doxy.config"
}

package() {
  cd "${srcdir}/${_pkgsrc}/documentation/generated_documentation/doc.bertinireal.com"
  install -d "${pkgdir}/usr/share/doc/${_name}/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/html/{}" \;
  rm -f "${pkgdir}/usr/share/doc/${_name}/html/.gitignore"
}
