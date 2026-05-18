# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
pkgname=agildospecs
_githubuser=juglesbass
_repo=AgildoSpecs
pkgver=2.1.6
pkgrel=1
pkgdesc="Informacoes de hardware estilo CPU-Z: CPU, RAM, dual channel, discos (PyQt6)"
arch=("any")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")
depends=("python" "python-pyqt6" "python-psutil" "dmidecode" "pciutils" "util-linux")
optdepends=(
  "nvidia-utils: detalhes GPU NVIDIA"
  "mesa-utils: fallback glxinfo para nome da GPU"
  "hwinfo: fallback se lspci nao listar placa"
  "polkit: pkexec para SMBIOS (RAM e dual channel)"
  "smartmontools: estado SMART dos discos"
)
install="${pkgname}.install"
source=(
  "${_repo}-${pkgver}.tar.gz::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz"
  "agildospecs.desktop"
)
sha256sums=(
  "b16278dabc7bdcb4e1e62b4dc6dc3f38e2995d978bfc209ff848173ecce4855c"
  "1bbbec1a37b3e583bc684d8812a0691db47cc0833fa7484d787de294e00985d1"
)

package() {
  cd "${srcdir}/${_repo}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -m644 agildospecs.py "${pkgdir}/usr/lib/${pkgname}/"
  cp -r agildo_specs "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
export PYTHONPATH="/usr/lib/agildospecs${PYTHONPATH:+:$PYTHONPATH}"
exec python -u /usr/lib/agildospecs/agildospecs.py "$@"
EOF
  install -Dm644 "${srcdir}/agildospecs.desktop" \
    "${pkgdir}/usr/share/applications/agildospecs.desktop"
  if [[ -f data/icons/hicolor/scalable/apps/agildospecs.svg ]]; then
    install -Dm644 data/icons/hicolor/scalable/apps/agildospecs.svg \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/agildospecs.svg"
  fi
}
