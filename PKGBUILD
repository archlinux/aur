# Maintainer: fnrir <stepien241@gmail.com>
# Contributer: DrakeTDL <everyone@disroot.org>
_pkgname="an-anime-game-launcher"
pkgname="$_pkgname-patched-git"
pkgver=3.6.0.r2.g1795386
pkgrel=1
pkgdesc="A Launcher for a specific anime game with auto-patching, discord rpc and time tracking (with a couple of fixes)"
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
makedepends=(cargo)
optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)
provides=($_pkgname $_pkgname-git)
source=(
  "git+https://github.com/an-anime-team/an-anime-game-launcher"
  "git+https://github.com/an-anime-team/anime-launcher-sdk"
  "${_pkgname}.desktop"
  "use-cloned-sdk.patch"
  "fix-sandbox.patch"
  "discord-no-panic.patch"
)
noextract=()
sha256sums=(
  SKIP
  SKIP
  "3bb15b29fd47e60ead712a67046daf42bd0ba5547d379ead6ea9bba37ea7b137"
  "41bf614e86d2b439dde5dd60ea2e1384f420656d24cc5f075e2b4e9d0fb2b31d"
  "7a60bb9654dd6cf9c5612a9297c540b3334a16ef61048c54132b34dd5202d75b"
  "4ef3c5141e585516fbfa86aa7da1c321fca3ecc342a757c6f82c1dbca5f4e2b8"
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive --single-branch

  sdkver=$(grep -Pazo '(?s)\[dependencies\.anime-launcher-sdk\]\ngit = "\S+"\ntag = "\S+"' Cargo.toml | tail -n 1 | cut -d '"' -f 2)
  # Use cloned anime-launcher-sdk
  patch -up1 -i "../use-cloned-sdk.patch"
  cd "../anime-launcher-sdk"
  git switch --detach $sdkver
  # Fix launching game w/ sandboxing and w/o /var/home
  patch -up1 -i "../fix-sandbox.patch"
  # Don't panic when not connected to Discord rpc
  patch -up1 -i "../discord-no-panic.patch"
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
