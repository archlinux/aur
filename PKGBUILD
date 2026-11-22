# Maintainer: asafelobotomy
# Source build of a tagged release. `updpkgsums` fills the checksum at release time.
pkgname=bindaru
pkgver=0.1.8
pkgrel=1
pkgdesc='pacman and AUR package store for uQ, with a visible AUR review gate'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/bindaru'
license=('GPL-3.0-or-later')
depends=('pacman' 'polkit' 'git' 'base-devel' 'curl' 'qt6-declarative' 'kirigami')
makedepends=('cargo' 'clang')
optdepends=('uq: the Software page in uQ Settings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Keep !lto: makepkg's LTO flags make the cxx-qt C++ objects unreadable to the linker
# (undefined reference to cxx_qt_init_crate_*), as in uq's PKGBUILD.
options=(!lto)
sha256sums=('c657dd7a684dcac5598fa0671e5c9801577978a9dec24994923981f70f9e0406')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" scripts/install-files.sh
}
