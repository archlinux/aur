# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: xstraok <maximkorotkov4@gmail.com>
# Contributor: DrakeTDL <everyone@disroot.org>
# Based on https://aur.archlinux.org/packages/an-anime-game-launcher-git
pkgname="anime-games-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=1.0.0.r3.g762e822
pkgrel=1
pkgdesc="Universal linux launcher for anime games"
arch=("x86_64")
url="https://github.com/an-anime-team/anime-games-launcher"
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
  "git+https://github.com/an-anime-team/anime-games-launcher"
  "${_pkgname}.desktop"
)
noextract=()
md5sums=('SKIP'
         '654ba383b74455d04c96d88ad40013ee')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"

  cp target/release/anime-games-launcher "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/pixmaps/anime-games-launcher.png"
  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.anime-games-launcher.png"
  install -Dm644 "${srcdir}/anime-games-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}
