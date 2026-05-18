# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Upstream: https://github.com/juglesbass/AgildoThermo

pkgname=agildothermo
_githubuser=juglesbass
_repo=AgildoThermo

pkgver=1.1.0
pkgrel=1

pkgdesc="Monitor na bandeja: CPU, GPU, RAM, HUD flutuante e alertas (PyQt6)"
arch=("any")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "python"
  "python-psutil"
  "python-pyqt6"
)
optdepends=(
  "nvidia-utils: sensores NVIDIA via nvidia-smi"
  "kde-cli-tools: kdesu para abrir Cheats como root"
)

install="${pkgname}.install"

_source_file="${_repo}-${pkgver}.tar.gz"
source=(
  "${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz"
  "agildothermo.desktop"
)
sha256sums=('3f5da32b9f1cb3f71c91f6711d9f19c642d9bc5a89044f0df4643b9367504be9'
            '1b74ca1072141670c4352b2142893e3cbaa8e8b296bebc6d05895a62d65d9cae')

package() {
  cd "${srcdir}/${_repo}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -m644 agildo_thermo.py "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
# Wayland nativo no KDE; xcb só se AGILDO_THERMO_FORCE_XCB=1
export AGILDO_THERMO_FORCE_XCB="${AGILDO_THERMO_FORCE_XCB:-}"
exec python -u /usr/lib/agildothermo/agildo_thermo.py "$@"
EOF

  install -Dm644 "${srcdir}/agildothermo.desktop" \
    "${pkgdir}/usr/share/applications/agildothermo.desktop"

  local icone="${pkgdir}/usr/share/icons/hicolor"
  for tam in 16 22 24 32 48 64 128 256; do
    if [[ -f "data/icons/hicolor/${tam}x${tam}/apps/agildothermo.png" ]]; then
      install -Dm644 "data/icons/hicolor/${tam}x${tam}/apps/agildothermo.png" \
        "${icone}/${tam}x${tam}/apps/agildothermo.png"
    fi
  done
  if [[ -f data/icons/hicolor/scalable/apps/agildothermo.svg ]]; then
    install -Dm644 data/icons/hicolor/scalable/apps/agildothermo.svg \
      "${icone}/scalable/apps/agildothermo.svg"
  fi
  if [[ -f icone_thermo.png ]]; then
    install -Dm644 icone_thermo.png "${pkgdir}/usr/share/pixmaps/agildothermo.png"
  fi
}
