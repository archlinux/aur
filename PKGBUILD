# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-apollo
_gitpkgname=apollo
pkgver=1.0.3
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

sha512sums=(
  '22b220d9d2ba0e003f38ef790ce50186a78433139eaa77e2728d0070d4bb1ee716ddfead459666c4c1b3b00a1961b110289b9633d7725e55f147d6831ab721d8'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

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
  if ! grep -qF 'No Apollo or valid LUNA device found' actual.txt; then
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

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
