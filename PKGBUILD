# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-git
pkgver=r39.4742d4e
pkgrel=1
pkgdesc="A GTK4 terminal multiplexer for Linux with Claude Code integration"
arch=('x86_64')
url="https://github.com/asermax/seemux"
license=('LicenseRef-unknown')
depends=('gtk4' 'vte4' 'glib2' 'pango' 'glibc')
makedepends=('cargo' 'git')
optdepends=('socat: Claude Code hook communication')
provides=('seemux')
conflicts=('seemux')
source=("$pkgname::git+https://github.com/asermax/seemux.git")
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
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/seemux" "$pkgdir/usr/bin/seemux"
  install -Dm0644 "extra/linux/seemux.desktop" "$pkgdir/usr/share/applications/seemux.desktop"
  install -Dm0644 "extra/logo/seemux-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/seemux.png"
  install -Dm0644 "extra/logo/seemux-256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/seemux.png"
  install -Dm0644 "extra/logo/seemux-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/seemux.png"
  install -Dm0644 "extra/logo/seemux-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/seemux.png"
}
