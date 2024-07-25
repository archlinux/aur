# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-apollo
_gitpkgname=apollo
pkgver=1.1.0
pkgrel=1
pkgdesc='Microcontroller-based FPGA/JTAG programmer'
arch=('any')
url='https://github.com/greatscottgadgets/apollo'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-deprecation'
  'python-prompt_toolkit'
  'python-pyusb'
  'python-pyvcd'
  'python-pyxdg'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'python-amaranth: for flashing'
  'python-luna-usb: to use the flash-fast subcommand'
  'python-pyserial: to connect to an integrated logic analyzer'
  'python-usb-protocol: for flashing'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/greatscottgadgets/apollo/archive/v${pkgver}.tar.gz"
)

sha512sums=('a9a4db93b9c1444653d7e77b2db1c7c115ee8d0eeb850dc0f88475c4d557710610b4e6536f174041e9f872821f8857419c4b64ed7e7d8cdf756d2b0c9af38e2b')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  local _site_packages LUNA_USB_IDS PYTHONPATH
  python -m installer --destdir=tmp_install dist/*.whl

  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}"
  export PYTHONPATH

  echo >&2 'Testing the executable'
  "tmp_install/usr/bin/${_gitpkgname}" info >actual.txt 2>&1 || true
  if ! grep -qF "Apollo version: ${pkgver}" actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging udev rules'
  install -D -m 644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    misc/*.rules

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
