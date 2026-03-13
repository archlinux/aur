#!/usr/bin/env bash
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: TRCC Linux Contributors <noreply@github.com>

pkgname=thermalright-trcc-git
_pkgname=thermalright-trcc-linux
pkgver=8.3.7.r3.gc9c9c8a
pkgrel=1
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
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-pip'
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
