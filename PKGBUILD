#!/usr/bin/env bash
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: TRCC Linux Contributors <noreply@github.com>

pkgname=thermalright-trcc-git
_pkgname=thermalright-trcc-linux
pkgver=9.12.0.r2.g8a43859
pkgrel=2
pkgdesc="Thermalright LCD/LED Control Center for Linux (git version)"
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
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
)
provides=('thermalright-trcc')
conflicts=('thermalright-trcc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}" || return 1

  local _tag_raw _tag _rev _hash
  _tag_raw="$(git describe --tags --abbrev=0 2>/dev/null || true)"
  _hash="$(git rev-parse --short=7 HEAD)"

  if [[ -n "${_tag_raw}" ]]; then
    _tag="${_tag_raw#v}"
    _rev="$(git rev-list --count "${_tag_raw}"..HEAD)"
    printf '%s.r%s.g%s\n' "${_tag}" "${_rev}" "${_hash}"
  else
    _rev="$(git rev-list --count HEAD)"
    printf '0.r%s.g%s\n' "${_rev}" "${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}" || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}" || return 1

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
