# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kaskade"
pkgver=4.0.7
pkgrel=1
pkgdesc="A text user interface for Kafka. Interact and consume topics from your terminal in style!"
arch=(
  'any'
)
url="https://github.com/sauljabin/${pkgname}"
license=(
  'MIT'
)
depends=(
  'python>=3.10'
  'python-click'
  'python-cloup>=3.0'
  'python-confluent-kafka>=2.13'
  'python-fastavro'
  'python-protobuf'
  'python-rich'
  'python-textual>=8.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core>=2.0.0'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
  # "${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.publish.attestation"
)
sha256sums=('cd907eb673d733ba27f4f89b649ad6bf19cd829745ae0dd8879989eb5a6bcc36')

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
