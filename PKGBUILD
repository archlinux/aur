#!/usr/bin/env bash
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: TRCC Linux Contributors <noreply@github.com>

pkgname=thermalright-trcc
pkgver=9.12.0
pkgrel=2
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
  'python-pyudev'
  'python-click'
  'python-typer'
  'python-fastapi'
  'uvicorn'
  'python-websockets'
  'python-cryptography'
  'python-python-multipart>=0.0.18'
  'python-prompt_toolkit'
  'python-certifi'
  'libusb'
  'sg3_utils'
  '7zip'
  'dmidecode'
  'polkit'
)
# Keep hardware-specific providers optional: NVIDIA pulls a driver stack;
# python-hidapi and python-hid conflict, and Steam Deck needs python-hid.
optdepends=(
  'python-nvidia-ml-py: NVIDIA GPU sensor support'
  'python-dbus: Wayland session support'
  'python-gobject: Wayland session support'
  'python-hidapi: HID panel support (install this or python-hid)'
  'python-hid: HID panel support (install this or python-hidapi)'
  'python-sounddevice: Audio visualizer support (AUR; installs PortAudio)'
  'python-qrcode: Remote pairing QR codes'
  'ffmpeg: Video playback and audio capture'
  'smartmontools: Disk health sensors'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
conflicts=('thermalright-trcc-git')
source=(
  "thermalright-trcc-linux-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('3acbbccfaed3fb0619e973a5da91e4702b82cf117a496b6c6ca209a7fb0d4971')

build() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/thermalright-trcc-linux-${pkgver}" || return 1

  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/trcc_linux-*.whl

  # udev rules
  install -Dm644 packaging/udev/70-trcc-lcd.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-trcc-lcd.rules"
  install -Dm644 packaging/udev/70-trcc-rgb.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-trcc-rgb.rules"
  # Device-access group referenced by the udev rules
  install -Dm644 packaging/sysusers/trcc.conf \
    "${pkgdir}/usr/lib/sysusers.d/trcc.conf"
  # modprobe config (USB storage quirks)
  install -Dm644 packaging/modprobe/trcc-lcd.conf \
    "${pkgdir}/usr/lib/modprobe.d/trcc-lcd.conf"
  # modules-load (SCSI generic)
  install -Dm644 packaging/modprobe/trcc-sg.conf \
    "${pkgdir}/usr/lib/modules-load.d/trcc-sg.conf"
  install -Dm644 packaging/modprobe/trcc-rapl.conf \
    "${pkgdir}/usr/lib/modules-load.d/trcc-rapl.conf"
  # desktop entry
  install -Dm644 src/trcc/assets/trcc-linux.desktop \
    "${pkgdir}/usr/share/applications/trcc-linux.desktop"
  # polkit policy
  install -Dm644 src/trcc/assets/com.github.lexonight1.trcc.policy \
    "${pkgdir}/usr/share/polkit-1/actions/com.github.lexonight1.trcc.policy"
  # Executables referenced by the polkit policy
  local helper
  for helper in trcc-imc trcc-dmi trcc-ram-access trcc-ram-access-off \
      trcc-module-devices trcc-module-devices-off; do
    install -Dm755 "src/trcc/assets/${helper}" "${pkgdir}/usr/bin/${helper}"
  done
  # systemd service
  install -Dm644 src/trcc/assets/trcc-quirk-fix.service \
    "${pkgdir}/usr/lib/systemd/system/trcc-quirk-fix.service"

  # Optional user daemon: ship the unit without enabling or starting it.
  install -Dm644 packaging/systemd/trccd.service \
    "${pkgdir}/usr/lib/systemd/user/trccd.service"

  local manpage
  for manpage in man/man1/*.1; do
    install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/${manpage##*/}"
  done

  # app icons
  local size
  for size in 256 128 64 48 32 24 16; do
    install -Dm644 "src/trcc/assets/icons/trcc_${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/trcc.png"
  done

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
