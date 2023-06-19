# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>

_pkgname=duckstation
pkgname="${_pkgname}"
pkgver=2023.06.08
_pkgver="latest"
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(
  x86_64
  aarch64
  i686
  pentium4
)
url="https://github.com/stenzek/${_pkgname}"
license=(GPL3)
makedepends=(
  cmake
  extra-cmake-modules
  git
  qt6-tools
  libdrm
  libpulse
  alsa-lib
  sndio
  gtk3
  ninja
)
depends=(sdl2 qt6-base)
optdepends=('psx-bios: PlayStation Bioses')
_commit="2d78b3f26a18600cbeb1f7add97f345d7345deeb"
source=(
  "${_pkgname}-${_pkgver}::git+${url}#commit=${_commit}"
  # "${url}/archive/refs/tags/${_pkgver}.tar.gz"
)
sha256sums=(
  'SKIP'
  #'adc6af10f1a14059ebb00637dac7283760f6ef647ebaec224a0e6e88ac901f0a'
)

build() {
    cmake -B build -S "${_pkgname}-${_pkgver}" \
        -DBUILD_NOGUI_FRONTEND=OFF \
        -DUSE_WAYLAND=ON \
        -G Ninja \
        -Wno-dev
    ninja -C build
}

package() {
    # Main files
    install -m755 -d "${pkgdir}/opt"
    cp -rv build/bin "${pkgdir}/opt/${_pkgname}"

    # Symlink to /usr/bin
    install -m755 -d "${pkgdir}/usr/bin"
    ln -svt "${pkgdir}/usr/bin" "/opt/${_pkgname}/${_pkgname}"-{qt,nogui}

    # Desktop file
    cat > "${_pkgname}-${_pkgver}/data/resources/${_pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation 1 Emulator
Comment=Fast PlayStation 1 emulator
Icon=duckstation
TryExec=duckstation-qt
Exec=duckstation-qt %f
Categories=Game;Emulator;Qt;
EOF
    install -Dm644 "${_pkgname}-${_pkgver}/data/resources/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-qt.desktop"
    install -Dm644 "${_pkgname}-${_pkgver}/data/resources/images/duck.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
