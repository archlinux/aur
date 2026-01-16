# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-viewer-git
_app_id=org.codeberg.bhh32.CosmicViewer
pkgver=r34.c010c76
pkgrel=1
pkgdesc="An image viewer for the COSMIC desktop environment."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/bhh32/cosmic-viewer"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'desktop-file-utils'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://codeberg.org/bhh32/cosmic-viewer.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"

  # Add StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="${_app_id}" \
    "data/${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
