# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kaskade"
pkgver=2.3.7
pkgrel=1
pkgdesc="A text user interface for Kafka. Interact and consume topics from your terminal in style!"
arch=('any')
url="https://github.com/sauljabin/${pkgname}"
license=('MIT')
depends=('python>=3.10' 'python-cloup' 'python-textual'
         'python-confluent-kafka' 'python-rich' 'python-protobuf'
         'python-click')
makedepends=('python-build' 'python-installer' 'python-poetry-core>=1')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b3ecafc1b5a8e3e131f577a44c61955efaf6198c8123c312e0f7d95b05d903fe')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -f "${pkgdir}${site_packages}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
