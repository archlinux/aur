# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pybertini-docs"
pkgname="${_pkgname}-git"
pkgver=1.0.alpha5.r1680.78f9986
pkgrel=1
pkgdesc="HTML documentation for pybetini"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'pybertini' 'python-sphinx' 'python-sphinxcontrib-bibtex')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count HEAD)
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}/python"
  local version=$(sed -n 's/AC_INIT(\[pybertini\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/python/docs/source"
  sed -i 's/language = None/language = \"English\"/' conf.py
  sed -i 's/homotopycontinuation_generic_40ppi/homotopycontinuation_generic/' intro.rst
}

build() {
  cd "${srcdir}/${_pkgsrc}/python/docs"
  make html   
}

package() {
  cd "${srcdir}/${_pkgsrc}/python"
  find "examples" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/pybertini/{}" \;
  
  cd "docs/build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/pybertini/{}" \;
}
