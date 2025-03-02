# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kaskade"
pkgver=4.0.4
pkgrel=1
pkgdesc="A text user interface for Kafka. Interact and consume topics from your terminal in style!"
arch=('any')
url="https://github.com/sauljabin/${pkgname}"
license=('MIT')
depends=('python>=3.10' 'python-click' 'python-cloup>=3' 'python-confluent-kafka' # >=2.8
         'python-fastavro' 'python-protobuf' 'python-rich' 'python-textual>=2.1')
makedepends=('python-build' 'python-installer' 'python-poetry-core>=1')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a64c7c2b18d7ac15eb25f089adc8ce9b4543af6ae82c559222a325b0e6f1ddb4')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -f "${pkgdir}${site_packages}/LICENSE"

  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/LICENSE" "LICENSE"
}
