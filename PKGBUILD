# Maintainer: Max Roder <maxroder@mailbox.org>
# Contributor: grigio <https://github.com/grigio>

pkgname=kanshi-gtk4-git
_pkgname=kanshi-gtk4
pkgver=0.4.0.r0.g5d54ea3
pkgrel=1
pkgdesc="Arrange displays on Wayland and save the layout as a kanshi profile"
arch=('x86_64')
url="https://github.com/grigio/kanshi-gtk4"
license=('GPL-3.0-only')
depends=('cairo' 'glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc'
         'wlr-randr')
makedepends=('git' 'cargo' 'pkgconf')
optdepends=('kanshi: persist layouts across reboot and hotplug'
            'cosmic-randr: real mirroring on COSMIC')
checkdepends=('desktop-file-utils' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  desktop-file-validate data/io.github.kanshi_gtk4.desktop
  # watchdog_restores_when_the_app_never_confirms is racy: it reads the
  # watchdog's marker right after the outputs flip back, before the watchdog
  # has written it (src/watchdog.rs), and fails about one run in five.
  cargo test --frozen -- --skip watchdog_restores_when_the_app_never_confirms
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/kanshi-gtk4 "$pkgdir/usr/bin/kanshi-gtk4"
  install -Dm644 data/io.github.kanshi_gtk4.desktop \
    "$pkgdir/usr/share/applications/io.github.kanshi_gtk4.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/io.github.kanshi_gtk4.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.kanshi_gtk4.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
