# Maintainer: DrakeTDL <everyone@disroot.org>
pkgname="an-anime-game-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=2.3.8.r23.g6a4afb1
pkgrel=2
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=("x86_64")
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=("GPL3")
groups=()
depends=(libayatana-appindicator tar unzip xdelta3 cabextract git curl iputils webkit2gtk libnotify)
makedepends=(yarn)
checkdepends=()
optdepends=(
  "mangohud: FPS Hud/GUI"
  "vkbasalt: Custom shaders (install this and reshade-shaders-git)"
  "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
  "gamemode: Game Optimizations"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  # "${pkgname}"::"git+${url}"
  "git+https://github.com/an-anime-team/an-anime-game-launcher"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
noextract=()
sha256sums=(
  SKIP
  "d47f8defce9030bc807e1f573cc024e2523e31a52638cf11f29400f252d7fa57"
  "3bb15b29fd47e60ead712a67046daf42bd0ba5547d379ead6ea9bba37ea7b137"
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  yarn
  yarn neu update
}

build() {
  cd "${_pkgname}"
  yarn build
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${srcdir}/an-anime-game-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "dist/${_pkgname}/public/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "dist/${_pkgname}/resources.neu" "${pkgdir}/usr/share/${_pkgname}/resources.neu"
  install -Dm755 "dist/${_pkgname}/${_pkgname}-linux_x64" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

  cd "dist/${_pkgname}/public"
  find * -type f -exec install -Dm 755 {} "${pkgdir}/usr/share/${_pkgname}/public/"{} \;
}
