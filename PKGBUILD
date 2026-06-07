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

pkgver=1.3.4
pkgrel=1

pkgdesc="Dock de aplicativos para KDE Plasma com Layer Shell, Kirigami e efeito de onda"
arch=("x86_64")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later") # ajustar à licença real / adicionar ficheiro custom em package()

depends=(
  "gcc-libs"
  "glibc"
  "kirigami"
  "kwindowsystem"
  "layer-shell-qt"
  "qt6-base"
  "qt6-declarative"
  "qt6-shadertools"
  "qt6-wayland"
)
makedepends=("cmake" "ninja" "extra-cmake-modules")

optdepends=("kdotool: focar, minimizar e fechar janelas em sessão Plasma Wayland")

install="${pkgname}.install"

validpgpkeys=()

_source_file="${_repo}-${pkgver}.tar.gz"
# ATENÇÃO: não envies SKIP ao servidor AUR com tarball estático — corre «updpkgsums» aqui primeiro.
source=("${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c32f8b3e4a76e0baddf826d66bb3889c5dbc20d8ce8b344ba9e441000ab06166')

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
