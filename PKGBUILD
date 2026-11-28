# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Repositório: https://github.com/juglesbass/AgildoDockCpp_Wayland — etiqueta v${pkgver}.
# Fluxo rápido:
#   updpkgsums
#   makepkg -fci
#   makepkg --printsrcinfo > .SRCINFO   # obrigatório para o servidor AUR
#   cd .. && aurpublish agildodock        # ou: git clone ssh://aur@aur.archlinux.org/agildodock.git

pkgname=agildodock

# ─── Repositório no GitHub (tarball archive/refs/tags/v${pkgver}.tar.gz) ────
_githubuser=juglesbass
_repo=AgildoDockCpp_Wayland # pasta ao extrair: ${_repo}-${pkgver}

pkgver=2.0.1
pkgrel=1

pkgdesc="Dock Liquid Glass e Barra Superior integrada para Wayland (KDE Plasma / Hyprland)"
arch=("x86_64")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "gcc-libs"
  "glibc"
  "kglobalaccel"
  "kirigami"
  "kpipewire"
  "kwindowsystem"
  "layer-shell-qt"
  "qt6-base"
  "qt6-declarative"
  "qt6-shadertools"
  "qt6-wayland"
  "wayland"
)
makedepends=(
  "cmake"
  "extra-cmake-modules"
  "ninja"
  "plasma-wayland-protocols"
  "qt6-tools"
)
optdepends=(
  "networkmanager: controles rápidos de Wi-Fi e VPN no Centro de Controle"
  "bluez: controles rápidos de Bluetooth no Centro de Controle"
  "power-profiles-daemon: seletor de perfis de energia no Centro de Controle"
)

install="${pkgname}.install"

validpgpkeys=()

_source_file="${_repo}-${pkgver}.tar.gz"
# ATENÇÃO: não envies SKIP ao servidor AUR com tarball estático — corre «updpkgsums» aqui primeiro.
source=("${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e116548a563470b9d800ec5902035e0d0d43b63373b1b504de2d85f74544b937')

build() {
  cd "${srcdir}/${_repo}-${pkgver}"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --parallel
}

check() {
  cd "${srcdir}/${_repo}-${pkgver}"
  QT_QPA_PLATFORM=offscreen LANG=C.UTF-8 ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}/${_repo}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
}
