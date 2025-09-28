pkgname=waybar-module-music-git
pkgver=0.2.1_r177.f589947
pkgrel=1
pkgdesc='A Waybar module to show & control the current MPRIS media players state'
arch=('x86_64')
url="https://github.com/Andeskjerf/waybar-module-music"
license=('GPL3')
depends=('dbus')
makedepends=('rust' 'git')
optdepends=('waybar: for integration with Waybar')
source=("${pkgname}::git+https://github.com/Andeskjerf/waybar-module-music.git")
sha256sums=('SKIP')
provides=('waybar-module-music')
conflicts=('waybar-module-music')

pkgver() {
  cd ${pkgname}
  cargo_version=$(grep '^version' Cargo.toml | head -n1 | cut -d'"' -f2)
  printf "${cargo_version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${pkgname}
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}
  cargo test --frozen --offline
}

package() {
  cd ${pkgname}
  install -Dt "$pkgdir"/usr/bin ${CARGO_TARGET_DIR:-target}/release/waybar-module-music
}
