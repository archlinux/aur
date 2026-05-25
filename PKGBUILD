# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="teleprox"
pkgname="python-${_pypiname}"
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple python object proxies over TCP"
arch=(
  'any'
)
url="https://github.com/campagnola/${_pypiname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'python>=3.6'
  'python-pyzmq'
  'python-msgpack'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools>=61.0'

  'cosign'
)
checkdepends=(
  'procps-ng'
  'python-pytest'
  'python-pyqt6'
  'python-numpy'
  'xorg-server-xvfb'
)
optdepends=(
  'python-colorama: colorful logs'
  'python-numpy: SharedNDArray support'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "python-${_pkgsrc}-release.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
  "python-${_pkgsrc}-release.tar.gz.sigstore.json::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.sigstore.json"
)
sha256sums=('519fc52991cdd86bbf033638e36482c030c3eca6408735864ae03f319be699a2'
            '2078a92a270a1bf70ca3fe94a6a8c5a750aa35092f789f79451b9636a7bc2190'
            '71ca3d09982ca9ac53c8a2db6b23931488fd095e82b99baa8016160b39140e68')

verify() {
  cosign verify-blob \
    --bundle "${source[1]%%::*}.sigstore.json" \
    --certificate-identity-regexp "${url}/.github/workflows/deploy.yml@refs/tags/v${pkgver}" \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    "${source[1]%%::*}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  xvfb-run -a pytest
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${pkgdir}"
  install -vd "usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE" \
    "usr/share/licenses/${pkgname}/LICENSE"

  cd "${site_packages#\/}"
  find . -mindepth 1 -maxdepth 1 -type d ! -name "${_pypiname}*" -exec \
    rm -rf "{}" +
}
