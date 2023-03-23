# Maintainer: DrakeTDL <everyone@disroot.org>
pkgname="an-anime-game-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=3.2.1.r7.g711cc82
pkgrel=2
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=("x86_64")
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=("GPL3")
depends=(
  cabextract
  curl
  git
  glibc
  gtk4
  iputils
  libadwaita
  tar
  unzip
  xdelta3
)
makedepends=(rust)
optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)
source=(
  "git+https://github.com/an-anime-team/an-anime-game-launcher"
  "${_pkgname}.desktop"
)
noextract=()
sha256sums=(
  SKIP
  "3bb15b29fd47e60ead712a67046daf42bd0ba5547d379ead6ea9bba37ea7b137"
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git switch next
  git submodule update --init --recursive --single-branch
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"

  cp target/release/anime-game-launcher "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  ln -s "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/pixmaps/an-anime-game-launcher.png"
  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.an-anime-game-launcher.png"
  install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}
