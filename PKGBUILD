# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Upstream: https://github.com/juglesbass/AgildoMonitor — etiqueta v${pkgver}

pkgname=agildomonitor

_githubuser=juglesbass
_repo=AgildoMonitor

pkgver=1.1
pkgrel=1

pkgdesc="Monitor de sistema (CPU, GPU, rede, processos) em PyQt6 para Linux"
arch=("any")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "python"
  "python-psutil"
  "python-pyqt6"
)
makedepends=()

optdepends=(
  "nvidia-utils: temperatura e VRAM em placas NVIDIA"
)

install="${pkgname}.install"

_source_file="${_repo}-${pkgver}.tar.gz"
source=(
  "${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz"
  "agildomonitor.desktop"
)
sha256sums=('c6bb1f73ca1a5f78418bdb68392c0797f3d29c59ce04984c2665ff98ff7088fc'
            'f6f23d7bec8bc6644701576d0690a53d2cd808c23f9bd06b6cfd9b10aa6a3be7')

package() {
  cd "${srcdir}/${_repo}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -m644 monitor_qt_melhorado.py "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec python -u /usr/lib/agildomonitor/monitor_qt_melhorado.py "$@"
EOF

  install -Dm644 "${srcdir}/agildomonitor.desktop" \
    "${pkgdir}/usr/share/applications/agildomonitor.desktop"

  if [[ -f icone.png ]]; then
    install -Dm644 icone.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/agildomonitor.png"
    install -Dm644 icone.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/agildomonitor.png"
    install -Dm644 icone.png "${pkgdir}/usr/share/pixmaps/agildomonitor.png"
  fi
}
