# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pybertini"
pkgname="python-${_name}-docs"
pkgver=1.0alpha5
_commit="436c6ec507594b13edf67212256f90d2b83fa121" # 1.0alpha5
pkgrel=1
pkgdesc="Python interface for Bertini2 (documentation)"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('python-pybertini' 'python-sphinx' 'python-sphinxcontrib-bibtex')
replaces=("${_name}-docs")
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b9b34a27a53924d2e4556c4646a791b6c918f7dc306450daae585d60177a9656')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/python"
  sed -nE "s/.*version='([^']+)'.*/\1/p" "setup.py" | sed -E 's/\.?(alpha|beta)/\1/'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/python/docs/source"
  sed -i 's/language = None/language = \"English\"/' "conf.py"
  sed -i 's/homotopycontinuation_generic_40ppi/homotopycontinuation_generic/' "intro.rst"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python/docs"
  make html   
}

package() {
  cd "${srcdir}/${_pkgsrc}/python/docs/build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/python-${_name}/{}" \;
}
