# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pybertini"
_pkgname="python-${_name}-docs"
pkgname="${_pkgname}-git"
pkgver=1.0alpha5.r1715.735bd7f
pkgrel=1
pkgdesc="Python interface for Bertini2 (documentation)"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'python-pybertini' 'python-sphinx' 'python-sphinxcontrib-bibtex')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
replaces=("${_name}-docs-git")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local rev_count=$(git rev-list --count HEAD)
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "python"
  local version=$(sed -nE "s/.*version='([^']+)'.*/\1/p" "setup.py" | sed -E 's/\.?(alpha|beta)/\1/')

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
  cd "${srcdir}/${_pkgsrc}/python/docs/build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-${_name}/{}" \;
}
