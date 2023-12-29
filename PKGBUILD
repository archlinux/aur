# Maintainer: xstraok <maximkorotkov4@gmail.com>
# Contributor: DrakeTDL <everyone@disroot.org>
pkgname="an-anime-game-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=3.9.4.r1.gfc9c650
pkgrel=1
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=("x86_64")
url="https://github.com/an-anime-team/an-anime-game-launcher"
license=("GPL3")
depends=(
  git
  p7zip
  glibc
  gtk4
  libadwaita
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
md5sums=(
  SKIP
  "f0cfe73897e8f49e92e0dfc41326fb0b"
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git switch next
  git submodule update --init --recursive --single-branch
  git pull
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"

  cp target/release/anime-game-launcher "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/pixmaps/an-anime-game-launcher.png"
  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.an-anime-game-launcher.png"
  install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}
