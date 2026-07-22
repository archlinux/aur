# Maintainer: L3-N0X <leon.goett@web.de>
pkgname=noti-notes-git
_binname=noti
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Minimal, keyboard-first Markdown note editor for Linux/Hyprland (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/L3-N0X/noti"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtksourceview5')
makedepends=('cargo' 'git')
provides=('noti-notes')
conflicts=('noti-notes' 'noti')
source=("$_binname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_binname"
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_binname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_binname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$_binname"
  install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 "resources/io.github.L3-N0X.noti.desktop" \
    "$pkgdir/usr/share/applications/io.github.L3-N0X.noti.desktop"
  install -Dm644 "resources/io.github.L3-N0X.noti.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.L3-N0X.noti.svg"
  install -Dm644 "resources/io.github.L3-N0X.noti.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.L3-N0X.noti.metainfo.xml"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
