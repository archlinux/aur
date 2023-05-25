# Maintainer: fnrir <stepien241@gmail.com>
# Contributer: DrakeTDL <everyone@disroot.org>
_pkgname="an-anime-game-launcher"
pkgname="$_pkgname-patched-git"
pkgver=3.7.0.r0.g7bae189
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
makedepends=(cargo python python-toml)
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
  "discord-no-panic.patch"
)
noextract=()
sha256sums=(
  SKIP
  SKIP
  "3bb15b29fd47e60ead712a67046daf42bd0ba5547d379ead6ea9bba37ea7b137"
  "41bf614e86d2b439dde5dd60ea2e1384f420656d24cc5f075e2b4e9d0fb2b31d"
  "207069d6510fbfa09a157f942da48c2985cb05780aa44c00f1ba9909201dacb1"
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive --single-branch

  #sdkver=$(grep -Pazo '(?s)\[dependencies\.anime-launcher-sdk\]\ngit = "\S+"\ntag = "\S+"' Cargo.toml | tail -n 1 | cut -d '"' -f 2)
  # Use cloned anime-launcher-sdk
  #patch -up1 -i "../use-cloned-sdk.patch"
  code='import toml
with open("Cargo.toml", "rt") as file:
  cargo = toml.load(file)
cargo["dependencies"]["anime-launcher-sdk"].pop("git")
ver = cargo["dependencies"]["anime-launcher-sdk"].pop("tag")
cargo["dependencies"]["anime-launcher-sdk"]["path"] = "../anime-launcher-sdk"
with open("Cargo.toml", "wt") as file:
  toml.dump(cargo, file)
print(f"sdkver={ver}")
'
  export $(echo "$code" | python)
  if [ -z "$sdkver" ];  then
    false
  fi
  cd "../anime-launcher-sdk"
  git switch --detach $sdkver
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
