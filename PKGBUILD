# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="flatlatex"
pkgname="python-${_name}"
pkgver=0.15
pkgrel=1
pkgdesc="A LaTeX math converter to unicode text"
arch=('any')
url="https://github.com/jb-leger/${_name}"
license=('BSD-2-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
checkdepends=('python-pytest')
depends=('python' 'python-regex')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d4762cdb85f2f0d7817b892e805b482ab8ac6ce2ab83c39d1311c4d9d5d4fc5b')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check () {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENCE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
