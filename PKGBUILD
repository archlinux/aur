# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname='python-pygreat'
_gitpkgname=libgreat
pkgver=2024.0.1
pkgrel=1
pkgdesc='Host-side drivers for communication with embedded devices'
arch=('any')
url='https://github.com/greatscottgadgets/libgreat'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-future'
  'python-libusb1'
  'python-pyusb'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/libgreat/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '099af99347b24f5ee4549320757aea0238bc257312ea3161192615c81e0d77ffe272a665cfcee144aae8ec21c693b19034a286a790afdee99b8132c420ecf98c'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('host/pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation host
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" host/dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
