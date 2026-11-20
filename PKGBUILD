# Maintainer: asafelobotomy
# Source build of a tagged release. `updpkgsums` fills the checksum at release time.
pkgname=bindaru
pkgver=0.1.3
pkgrel=1
pkgdesc='pacman and AUR package store for uQ, with a visible AUR review gate'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/bindaru'
license=('GPL-3.0-or-later')
depends=('pacman' 'polkit' 'git' 'base-devel' 'curl' 'qt6-declarative' 'kirigami')
makedepends=('cargo' 'clang')
optdepends=('uq: the Software page in uQ Settings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Keep !lto: makepkg's LTO flags make the cxx-qt C++ objects unreadable to the linker (undefined cxx_qt_init_crate_*).
options=(!lto)
sha256sums=('dc9c118182ec1c44d2bcccebb92dcbf8f8d9aa45c7dacf2ba21f223e8a3b1bc5')

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
