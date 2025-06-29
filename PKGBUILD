# Maintainer: morguldir <morguldir@protonmail.com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: xstraok <maximkorotkov4@gmail.com>
# Contributor: DrakeTDL <everyone@disroot.org>
# Based on https://aur.archlinux.org/packages/an-anime-game-launcher-git
pkgname="anime-games-launcher-git"
_pkgname="${pkgname%-git}"
pkgver=2.0.0.r1.g80ddc2d
pkgrel=2
pkgdesc="Universal linux launcher for anime games"
arch=("x86_64")
url="https://github.com/an-anime-team/anime-games-launcher"
license=("GPL-3.0-only")
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=(
  p7zip
  glibc
  gtk4
  libadwaita
  xdelta3
  cairo
  glib2
  gcc-libs
)
makedepends=(cargo git)
optdepends=(
  "mangohud: FPS Hud/GUI"
  "gamemode: Game Optimizations"
  "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)
source=("git+https://github.com/an-anime-team/anime-games-launcher#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/alpha2.//;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 assets/${_pkgname}.desktop "$pkgdir/usr/share/applications/moe.launcher.${_pkgname}.desktop"

  sed -i "s/Exec=AppRun/Exec=${_pkgname}/;s/Icon=icon/Icon=moe.launcher.${_pkgname}/g" "$pkgdir/usr/share/applications/moe.launcher.${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "assets/images/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.${_pkgname}.png"
  ln -s "/usr/share/icons/moe.launcher.${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
