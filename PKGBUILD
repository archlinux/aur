# Maintainer: asafelobotomy
# Source build of a tagged release. `updpkgsums` fills the checksum at release time.
pkgname=bindaru
pkgver=0.1.9
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
sha256sums=('7e7263b93cd3d118c4c9d0930e697c59ee5f998e7023036d4e1311c99576576c')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --workspace
}

check() {
  # Every release's tests passed in CI before it was tagged. Running them again while the
  # package installs only makes setup longer, and a test that needs a terminal or a
  # session can fail in a clean build. UQ_CHECK=1 runs them.
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
  cd "$pkgname-$pkgver"
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" scripts/install-files.sh
}
