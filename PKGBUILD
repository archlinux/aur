# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="coorx"
pkgname="python-${_pypiname}"
pkgver=3.0.0
pkgrel=1
pkgdesc="Object-oriented linear and nonlinear coordinate system transforms"
arch=(
  'any'
)
url="https://github.com/campagnola/${_pypiname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'python'
  'python-numpy'
  'python-pyqtgraph'
  'python-scipy'
  'python-vispy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools>=42'

  'cosign'
)
checkdepends=(
  'python-pytest'
  'python-pillow'
  'jupyter-nbclient'
)
_pkgsrc="${_pypiname}-${pkgver}"
source=(
  "python-${_pkgsrc}-release.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
  "python-${_pkgsrc}-release.tar.gz.sigstore.json::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.sigstore.json"
  "python-${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('96bb37186c6b27424777b9f6eea89d7f9bad4d4f5ca9b4c05e2ed63bf7515177'
            'b9944d4daeba9a3902f6d2137ee4455110c86fe3c98a9c3987991d16cd849801'
            'e1d20795ca3a5074249d647f76fb79e8bf4df16aa97ade7a4e6f0376dfa3bbc1')

verify() {
  cosign verify-blob \
    --bundle "${source[0]%%::*}.sigstore.json" \
    --certificate-identity-regexp "${url}/.github/workflows/deploy.yml@refs/tags/v${pkgver}" \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    "${source[0]%%::*}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest -k "not test_image and not test_systems"
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
