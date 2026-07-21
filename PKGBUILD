# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Thermo C++/Qt6 — substitui a versao Python no mesmo pacote agildothermo.

pkgname=agildothermo
_githubuser=juglesbass
_repo=AgildoThermo

pkgver=2.0.0
pkgrel=1

pkgdesc="Monitor na bandeja: CPU, GPU, RAM, disco e rede (C++/Qt6, nativo Wayland)"
arch=("x86_64")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "gcc-libs"
  "glibc"
  "qt6-base"
)
makedepends=(
  "cmake"
  "ninja"
  "librsvg"
)
optdepends=(
  "nvidia-utils: sensores NVIDIA via nvidia-smi"
  "kde-cli-tools: kdesu para abrir Cheats como root"
)

install="${pkgname}.install"

_source_file="${_repo}-${pkgver}.tar.gz"
source=(
  "${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz"
  "agildothermo-autostart.desktop"
)
sha256sums=('SKIP' '43d81b46fd58acf6604cac1dd31cc517d0bae9cf2868a777a1606beb74a03221')

prepare() {
  cd "${srcdir}/${_repo}-${pkgver}"
  bash packaging/gerar-icones.sh
}

build() {
  cd "${srcdir}/${_repo}-${pkgver}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/${_repo}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${srcdir}/agildothermo-autostart.desktop" \
    "${pkgdir}/etc/xdg/autostart/agildothermo.desktop"

  # Nome legado no menu (versao Python usava agildothermo.desktop)
  install -Dm644 data/org.agildosoft.agildothermo.desktop \
    "${pkgdir}/usr/share/applications/agildothermo.desktop"

  ln -sf org.agildosoft.agildothermo.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/agildothermo.svg"
}
