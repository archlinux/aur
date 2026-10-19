# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="teleprox"
pkgname="python-${_pypiname}"
pkgver=2.4.0
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
sha256sums=('99c0ca558aa340e2f3ffc360f490a1a876900eb11cadc9d666b0946b7b96d6d3'
            'f1b4755a7b7a15426a4a3759b3a390b6154bba6672eaf2d42e42e48c89a13222'
            '9fffa037eb6414c839f726e870e71f72d48808c4d603165b4a98591981badd07')

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
  install -vd "usr/share/licenses"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses" \
    "usr/share/licenses/${pkgname}"

  cd "${site_packages#\/}"
  find . -mindepth 1 -maxdepth 1 -type d ! -name "${_pypiname}*" -exec \
    rm -rf "{}" +
}
