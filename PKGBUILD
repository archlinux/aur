# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Fabio Loli

_git="false"
pkgname=duckstation
_majver="0.1"
_rev="6232"
_pkgver="${_majver}-${_rev}"
_commit="21bbe5c76cc95b2334585f62746905f8aa3464e2"
pkgver="${_majver}.r${_rev}"
_pkgdesc=(
  "A Sony PlayStation (PSX) emulator,"
  "focusing on playability, speed, and"
  "long-term maintainability (stable snapshot)"
)
pkgrel=1
arch=(
  x86_64
  aarch64
  i686
  pentium4
  arm
  risv32
  powerpc
  armv7h
)
_gh="github.com"
_http="https://${_gh}"
_ns="stenzek"
url="${_http}/${_ns}/${pkgname}"
license=(
  GPL3
)
makedepends=(
  alsa-lib
  cmake
  extra-cmake-modules
  gtk3
  libdrm
  libpulse
  ninja
  qt6-tools
  sndio
)
source=()
sha256sums=()
[[  "${_git}" == "true" ]] && \
  makedepends+=(
    git
  ) && \
  source+=(
    "${pkgname}-${_pkgver}::git+${url}#commit=${_commit}"
  ) && \
  sha256sums+=(
    SKIP
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
  ) && \
  sha256sums+=(
    "c061a7a65575242652cf2224a830b14881274f1569393f84af41de6304874fe2"
  )
depends=(
  sdl2
  qt6-base
)
optdepends=(
  'psx-bios: PlayStation Bioses'
)

build() {
  local \
    _cmake_opts=()
  _cmake_opts=(
    -B build
    -S "${pkgname}-${_pkgver}"
    -DBUILD_NOGUI_FRONTEND=ON
    -DUSE_WAYLAND=ON
    -G Ninja
    -Wno-dev
  )
  cmake \
    "${_cmake_opts[@]}"
  ninja \
    -C build
}

package() {
  local \
    _pkgdir="${pkgdir}"
  [[ ! -n "${TERMUX_VERSION}" ]] && \
    _pkgdir="${terdir}"
  # Main files
  install \
    -m755 \
    -d "${_pkgdir}/opt"
  cp \
    -rv \
    build/bin \
    "${_pkgdir}/opt/${pkgname}"

  # Symlink to /usr/bin
  install \
    -m755 \
    -d "${_pkgdir}/usr/bin"
  ln \
    -svt \
    "${_pkgdir}/usr/bin" \
    "/opt/${pkgname}/${pkgname}"-{qt,nogui}

  # Desktop file
  cat > \
    "${pkgname}-${_pkgver}/data/resources/${pkgname}.desktop" << EOF
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
  install \
    -Dm644 \
    "${pkgname}-${_pkgver}/data/resources/${pkgname}.desktop" \
    "${_pkgdir}/usr/share/applications/${pkgname}-qt.desktop"
  install \
    -Dm644 \
    "${pkgname}-${_pkgver}/data/resources/images/duck.png" \
    "${_pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

# vim:set sw=2 sts=-1 et:
