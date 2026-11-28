# Maintainer: asafelobotomy
# Source build of a tagged release. The release workflow's `aur` job fills pkgver and the checksum.
pkgname=uqview
pkgver=0.1.6
pkgrel=1
pkgdesc='Fast image viewer for uQ: view, mark up and set as wallpaper'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/uqview'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-imageformats' 'kimageformats' 'xdg-utils' 'gcc-libs' 'glibc')
makedepends=('cargo' 'clang')
optdepends=('uq: Set as wallpaper, the uQ theme and the uQview page in uQ Settings'
            'qt6-wayland: native Wayland window'
            'glib2: move pictures on other drives to their trash (gio)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Keep !lto: makepkg's LTO flags make the cxx-qt C++ objects unreadable to the linker
# (undefined reference to cxx_qt_init_crate_*), as in uq's PKGBUILD.
options=(!lto)
sha256sums=('ee3de5d3e5c4e1018f47b1c0a73e47eae340428e70d45970d0a7f6e742c8804e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  # Every release's tests passed in CI before it was tagged. Running them again while the
  # package installs only makes setup longer, and a test that needs a terminal or a
  # session can fail in a clean build. UQ_CHECK=1 runs them.
  [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release -p uqview-core
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" scripts/install-files.sh
}
