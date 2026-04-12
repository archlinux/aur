# Maintainer: liixini <https://github.com/liixini>
pkgname=skwd-daemon
pkgver=r0.0000000
pkgrel=1
pkgdesc='Daemon for Skwd Shell, a collection of Quickshell programs and widgets'
arch=('x86_64')
url='https://github.com/liixini/skwd-daemon'
license=('MIT')
makedepends=('cargo' 'gcc' 'pkgconf')
depends=('gcc-libs')
optdepends=(
  'ffmpeg: video wallpaper thumbnail extraction and conversion'
  'ollama: local LLM for automated wallpaper tagging'
  'steamcmd: Steam Workshop Wallpaper Engine downloads'
  'linux-wallpaperengine: Wallpaper Engine scene rendering'
)
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/liixini/skwd-daemon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="${CFLAGS//-flto*([^ ])/}"
  cargo build --frozen --release
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/skwd-daemon "$pkgdir/usr/bin/skwd-daemon"
  install -Dm755 target/release/skwd "$pkgdir/usr/bin/skwd"

  install -Dm644 data/skwd-daemon.service "$pkgdir/usr/lib/systemd/user/skwd-daemon.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
