# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="pybertini-docs"
pkgname="${_pkgname}-git"
pkgver=r1680.78f9986
pkgrel=1
pkgdesc="HTML documentation for pybetini"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'python' 'python-sphinx' 'python-sphinxcontrib-bibtex'
             'python-requests>=2.30.1' 'python-pygments' 'python-pillow'
             'pybertini')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
