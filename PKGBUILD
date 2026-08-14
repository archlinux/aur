# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="teleprox"
pkgname="python-${_pypiname}"
pkgver=2.3.0
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
sha256sums=('248f203923d47c29df477ace7c92d9d7d9f1f535f686eef820566d13d7b2e153'
            'c015101d3bc04ec630c5bbb4645a8d195eb3e3a58725fae0822c1b69460fd95e'
            'db90600fef10fd7c8e7a487b3feb398f03741ad109538234f08f4a8df3508de2')

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
