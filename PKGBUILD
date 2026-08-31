# Maintainer: smiley <smiley@aur.archlinux.org>
pkgname=rquickshare-next-git
pkgver=0.11.8.r4.g263c0fb
pkgrel=1
pkgdesc="NearbyShare/QuickShare implementation for Linux, macOS and Windows (rquickshare-next fork, built from latest git)"
arch=('x86_64')
url="https://github.com/AuthenticSm1les/rquickshare-next"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'rustup'
  'nodejs'
  'pnpm'
)
provides=('rquickshare')
conflicts=('rquickshare' 'rquickshare-x' 'rquickshare-x-bin')
source=(
  "$pkgname::git+$url.git"
  "rquickshare.desktop"
)
sha256sums=('SKIP'
            '433a8fbb8b5e5a4af815cabc5b8c149a0ac6a7de020d0d637eda87b37f9cb6ee')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname/app/main/src-tauri"
  rustup toolchain install "$(cat rust-toolchain)" --profile minimal
}

build() {
  cd "$pkgname/app/main"
  export RUSTUP_TOOLCHAIN
  RUSTUP_TOOLCHAIN="$(cat src-tauri/rust-toolchain)"

  pnpm install --frozen-lockfile
  pnpm vite:build

  cd src-tauri
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname/app/main/src-tauri/target/release/rquickshare" \
    "$pkgdir/usr/bin/rquickshare"

  install -Dm644 "$srcdir/rquickshare.desktop" \
    "$pkgdir/usr/share/applications/rquickshare.desktop"

  install -Dm644 "$srcdir/$pkgname/app/main/src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/rquickshare.png"
  install -Dm644 "$srcdir/$pkgname/app/main/src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/rquickshare.png"
  install -Dm644 "$srcdir/$pkgname/app/main/src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/rquickshare.png"
  install -Dm644 "$srcdir/$pkgname/app/main/src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/rquickshare.png"

  install -Dm644 "$srcdir/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
