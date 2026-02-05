# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cupola-git
_app_id=org.codeberg.bhh32.Cupola
pkgver=r53.fca1866
pkgrel=1
pkgdesc="An image viewer for the COSMIC desktop environment."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/bhh32/cupola"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'cmake'
  'desktop-file-utils'
  'git'
  'nasm'
)
checkdepends=('appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-viewer-git')
source=('git+https://codeberg.org/bhh32/cupola.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # Add StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="${_app_id}" \
    "data/${_app_id}.desktop"

  # Fix typo
  mv -f "data/${_app_id}.meta.info.xml" "data/${_app_id}.metainfo.xml"
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
