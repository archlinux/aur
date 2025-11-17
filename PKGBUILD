# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kaskade"
pkgver=4.0.6
pkgrel=1
pkgdesc="A text user interface for Kafka. Interact and consume topics from your terminal in style!"
arch=('any')
url="https://github.com/sauljabin/${pkgname}"
license=('MIT')
depends=(
  'python>=3.10'
  'python-click'
  'python-cloup>=3'
  'python-confluent-kafka>=2.12'
  'python-fastavro'
  'python-protobuf'
  'python-rich'
  'python-textual>=6.5'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core>=2'
)
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8d11f759fe85c7921def0e6e2680e2f6e8a1f00d08a752dc03f358c392eae2a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -f "${pkgdir}${site_packages}/LICENSE"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
