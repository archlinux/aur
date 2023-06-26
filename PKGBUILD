# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Fabio Loli

pkgname=duckstation
pkgver=2023.06.08
_pkgver="latest"
_pkgdesc=("A Sony PlayStation (PSX) emulator, focusing on playability, "
          "speed, and long-term maintainability (stable snapshot)")
pkgrel=1
arch=(
  x86_64
  aarch64
  i686
  pentium4
)
url="https://github.com/stenzek/${pkgname}"
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
  "${pkgname}-${_pkgver}::git+${url}#commit=${_commit}"
  # "${url}/archive/refs/tags/${_pkgver}.tar.gz"
)
sha256sums=(
  'SKIP'
  #'adc6af10f1a14059ebb00637dac7283760f6ef647ebaec224a0e6e88ac901f0a'
)

build() {
    local _cmake_opts=(
            -B build
            -S "${pkgname}-${_pkgver}"
            -DBUILD_NOGUI_FRONTEND=OFF
            -DUSE_WAYLAND=ON
            -G Ninja
            -Wno-dev)

    cmake "${_cmake_opts[@]}"
    ninja -C build
}

package() {
    # Main files
    install -m755 -d "${pkgdir}/opt"
    cp -rv build/bin "${pkgdir}/opt/${pkgname}"

    # Symlink to /usr/bin
    install -m755 -d "${pkgdir}/usr/bin"
    ln -svt "${pkgdir}/usr/bin" "/opt/${pkgname}/${pkgname}"-{qt,nogui}

    # Desktop file
    cat > "${pkgname}-${_pkgver}/data/resources/${pkgname}.desktop" << EOF
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
    install -Dm644 "${pkgname}-${_pkgver}/data/resources/${pkgname}.desktop" \
                   "${pkgdir}/usr/share/applications/${pkgname}-qt.desktop"
    install -Dm644 "${pkgname}-${_pkgver}/data/resources/images/duck.png" \
                   "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
