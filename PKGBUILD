#!/usr/bin/env bash
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=thermalright-trcc
pkgver=8.3.7
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
sha256sums=('30734648e2d4655ceb4a3e34c9c16b8e7187ba3de35f54dd7bd50bb7f22306e1')

build() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1

  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/trcc_linux-*.whl

  # Keep behavior aligned with upstream release workflow.
  python -m pip install --root="${pkgdir}" --prefix=/usr --no-deps uvicorn

  install -Dm644 packaging/udev/99-trcc-lcd.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-trcc-lcd.rules"
  install -Dm644 packaging/modprobe/trcc-lcd.conf \
    "${pkgdir}/usr/lib/modprobe.d/trcc-lcd.conf"
  install -Dm644 packaging/modprobe/trcc-sg.conf \
    "${pkgdir}/usr/lib/modules-load.d/trcc-sg.conf"
  install -Dm644 src/trcc/assets/trcc-linux.desktop \
    "${pkgdir}/usr/share/applications/trcc-linux.desktop"
  install -Dm644 src/trcc/assets/com.github.lexonight1.trcc.policy \
    "${pkgdir}/usr/share/polkit-1/actions/com.github.lexonight1.trcc.policy"
  install -Dm644 src/trcc/assets/trcc-quirk-fix.service \
    "${pkgdir}/usr/lib/systemd/system/trcc-quirk-fix.service"

  local size
  for size in 256 128 64 48 32 24 16; do
    install -Dm644 "src/trcc/assets/icons/trcc_${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/trcc.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
