#!/usr/bin/env bash
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: TRCC Linux Contributors <noreply@github.com>

pkgname=thermalright-trcc
pkgver=9.1.1
pkgrel=1
pkgdesc="Thermalright LCD/LED Control Center for Linux"
arch=('any')
url="https://github.com/Lexonight1/thermalright-trcc-linux"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'pyside6'
  'python-pillow'
  'python-numpy'
  'python-psutil'
  'python-pyusb'
  'python-click'
  'python-typer'
  'python-fastapi'
  'libusb'
  'sg3_utils'
  'p7zip'
)
# python-uvicorn not in official Arch repos — bundled via pip in package()
optdepends=(
  'python-pynvml: NVIDIA GPU sensor support'
  'python-dbus: Wayland session support'
  'python-gobject: Wayland session support'
  'python-hidapi: Alternative HID transport'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-pip'
)
conflicts=('thermalright-trcc-git')
source=(
  "thermalright-trcc-linux-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('386f2c565bb3f17f22b77d4ca3fa1d1a976508801a862dee193e58db04b1cd9b')

build() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1

  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/trcc_linux-*.whl

  # Bundle deps not in official Arch repos.
  python -m pip install --root="${pkgdir}" --prefix=/usr --no-deps uvicorn

  # udev rules
  install -Dm644 packaging/udev/99-trcc-lcd.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-trcc-lcd.rules"
  # modprobe config (USB storage quirks)
  install -Dm644 packaging/modprobe/trcc-lcd.conf \
    "${pkgdir}/usr/lib/modprobe.d/trcc-lcd.conf"
  # modules-load (SCSI generic)
  install -Dm644 packaging/modprobe/trcc-sg.conf \
    "${pkgdir}/usr/lib/modules-load.d/trcc-sg.conf"
  # desktop entry
  install -Dm644 src/trcc/assets/trcc-linux.desktop \
    "${pkgdir}/usr/share/applications/trcc-linux.desktop"
  # polkit policy
  install -Dm644 src/trcc/assets/com.github.lexonight1.trcc.policy \
    "${pkgdir}/usr/share/polkit-1/actions/com.github.lexonight1.trcc.policy"
  # systemd service
  install -Dm644 src/trcc/assets/trcc-quirk-fix.service \
    "${pkgdir}/usr/lib/systemd/system/trcc-quirk-fix.service"

  # app icons
  local size
  for size in 256 128 64 48 32 24 16; do
    install -Dm644 "src/trcc/assets/icons/trcc_${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/trcc.png"
  done

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
