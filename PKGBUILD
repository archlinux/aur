# Maintainer: anispwyn <anisphia_wynn_palettia@proton.me>
pkgname="sleepy-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=1.6.1.r0.gd1ab543
pkgrel=1
pkgdesc="Sleepy game launcher for Linux with telemetry disabling"
arch=("x86_64")
url="https://github.com/an-anime-team/sleepy-launcher"
license=("GPL3")
provides=("sleepy-launcher")
conflicts=("sleepy-launcher")
depends=(
  "git"
  "p7zip"
  "glibc"
  "gtk4"
  "libadwaita"
)
makedepends=(rust)
optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)
source=(
  "git+https://github.com/an-anime-team/sleepy-launcher"
  "sleepy-launcher.desktop"
)
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git fetch --tags
  # Fallback in case there are no tags
  if ! git describe --long --tags &>/dev/null; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}


prepare() {
  cd "$srcdir/${_pkgname}"
  git checkout next 
  git submodule update --init --recursive --single-branch
  git pull

}


build() {
  cd "$srcdir/${_pkgname}"
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release
}

package() {
  cd "$srcdir/${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"

  cp target/release/sleepy-launcher "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/pixmaps/sleepy-launcher.png"
  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.sleepy-launcher.png"
  install -Dm644 "${srcdir}/sleepy-launcher.desktop" -t "${pkgdir}/usr/share/applications"
} 
