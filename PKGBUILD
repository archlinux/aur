# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ochre"
pkgname="python-${_name}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A down-to-earth approach to colors"
arch=('any')
url="https://github.com/getcuia/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core>=1.0.0')
checkdepends=('python-pytest>=6.2' 'python-hypothesis>=6.31.6')
depends=('python>=3.8')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('218482b0e5d3fab6c250091862201380e8d90a67bfef545186624399a19bd19a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH=src pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
