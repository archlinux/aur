# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="pybertini"
pkgname="${_name}-docs"
pkgver=1.0.alpha5
_commit="436c6ec507594b13edf67212256f90d2b83fa121"
pkgrel=2
pkgdesc="HTML documentation for Pybertini"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('pybertini' 'python-sphinx' 'python-sphinxcontrib-bibtex')
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b9b34a27a53924d2e4556c4646a791b6c918f7dc306450daae585d60177a9656')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/python"
  sed -n 's/AC_INIT(\[pybertini\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./'
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
  find "examples" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
  
  cd "docs/build"
  find "html" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/{}" \;
}
