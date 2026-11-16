# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
# shellcheck disable=SC2164,SC2034,SC2154
_pkgauthor=vulnersCom
_pkgname=getsploit
_pkgurl="https://github.com/${_pkgauthor}/${_pkgname}"

pkgname="${_pkgname}"
pkgver=3.0.1
pkgrel=1
_pkgver="v${pkgver}"

pkgdesc="Command line utility for searching and downloading exploits"
url="https://github.com/vulnersCom/getsploit"

arch=('any')
license=('MIT')

depends=(
  'python'
  'python-click'
  'python-rich'
  'python-vulners'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
)
checkdepends=(
  'python-pytest>=8.3'
  'python-pytest-asyncio>=0.24'
  'python-pytest-cov>=5'
  'python-pytest-xdist>=3.6'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/archive/${_pkgver}.tar.gz"
  "00-remove-uv-build-version-constraint.patch"
)

sha256sums=('0725c6b171de3412e811743c2a3ceeaf626f88f651e700f7111c35f57d2cbced'
            '586d4325ecce6f27a60f1fb4fe638739fea4ea4993fe1807f47ebdf8a4597264')

prepare() {
  patch -p0 -N -i 00-remove-uv-build-version-constraint.patch
}

check() {
  cd "${_pkgname}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH=src test-env/bin/python -m pytest
}

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CONTRIBUTING.md SECURITY.md
}
