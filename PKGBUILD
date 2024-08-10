# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini2"
_pkgname="${_name}-docs"
pkgname="${_pkgname}-git"
pkgver=2.0.alpha8.r76.78f9986
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91"
pkgrel=1
pkgdesc="HTML documentation for Betini2"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'doxygen' 'plantuml' 'graphviz')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/core"
  local version=$(sed -n 's/AC_INIT(\[b2\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

build() {
  cd "${srcdir}/${_pkgsrc}/core/doc"
  doxygen "bertini.doxy.config"
}

package() {
  cd "${srcdir}/${_pkgsrc}/core/doc/generated_documentation/doc.bertini"
  install -d "${pkgdir}/usr/share/doc/${_name}/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/html/{}" \;
  rm -f "${pkgdir}/usr/share/doc/${_name}/html/.gitignore"
}
