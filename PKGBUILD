# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="teleprox"
pkgname="python-${_pypiname}"
pkgver=2.2.2
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
sha256sums=('03667dee29e8568178fd5de2bce45541725fa4d780f665fd114edce40898e4fb'
            '558d6665f5a446878266d28c65b092bc0d5fce0b62fe03b2ba40ea428ab70e6f'
            'd7d80a53070f9e8c0983b38dda1f8a8af875ef7316e9a1d42f706ce8990c58e6')

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
