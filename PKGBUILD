# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-apollo
_gitpkgname=apollo
pkgver=1.0.5
pkgrel=1
pkgdesc='Microcontroller-based FPGA/JTAG programmer'
arch=('any')
url='https://github.com/greatscottgadgets/apollo'
license=('BSD-3-Clause')
depends=(
  'python'
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

sha512sums=('44537ab4d6b10ad594b10f625ac3431e37ce293067e1483fc19beafe37ded68fc3e2034dd06b0e63a14ea673e439c1ff612dc8814d531daeb63cf9c6143ea9c5')

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

  # Do not use real hardware if connected at check time
  export LUNA_USB_IDS='0xffff:0xffff'

  echo >&2 'Testing the executable'
  "tmp_install/usr/bin/${_gitpkgname}" info >actual.txt 2>&1 || true
  if ! grep -qF 'No Apollo device or stub interface found' actual.txt; then
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
