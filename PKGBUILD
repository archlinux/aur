# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="stransi"
pkgname="python-${_name}"
pkgver=0.3.0
pkgrel=2
pkgdesc="A lightweight Python parser library for ANSI escape code sequences"
arch=('any')
url="https://github.com/getcuia/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core>=1')
checkdepends=('python-pytest>=6.2' 'python-hypothesis>=6.31.6')
depends=('python>=3.8' 'python-ochre>=0.4')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f83fb30c418054f87f3d9bdf3f82a130ec51ec5dcf6aa372f8493ed7132ba617')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH="${PWD}/src" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "FEATURES.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
