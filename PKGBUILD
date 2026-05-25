# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="rtprofile"
pkgname="python-${_pypiname}"
pkgver=1.0.2
pkgrel=1
pkgdesc="Real-time function and memory profiling tools for Python"
arch=(
  'any'
)
url="https://github.com/campagnola/${_pypiname}"
license=(
  'MIT' # ?
)
depends=(
  'python>=3.12'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools>=61.0'

  'cosign'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'python-pyqtgraph>=0.13.0: Qt profiling'
  'python-guppy3: memory profiling'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "python-${_pkgsrc}-release.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
  "python-${_pkgsrc}-release.tar.gz.sigstore.json::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.sigstore.json"
)
sha256sums=('9d1327a887a2d2f9e6ade0dce8aa0510e01ea841ae7787fea0e4d198fae0e412'
            '4a7db3d8ae39ab44bc13941683cd53e0ff8abda971cd32b2b778ba3e795611f9'
            '59800bee2e4ad1e5eafa88e8527c4753ab9e7451c9edc17fbb3128073aea9f92')

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
  pytest
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${pkgdir}"
  # install -vd "usr/share/licenses/${pkgname}"
  # ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE" \
  #   "usr/share/licenses/${pkgname}/LICENSE"

  cd "${site_packages#\/}/${_pypiname}"
  rm -rf "tests"
}
