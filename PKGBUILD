# Maintainer: asafelobotomy
# Source build of a tagged release. The release workflow's `aur` job fills pkgver and the checksum.
pkgname=uqview
pkgver=0.1.1
pkgrel=1
pkgdesc='Fast image viewer for uQ: view, mark up and set as wallpaper'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/qview'
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
sha256sums=('677ba86a4b86370d414acf4ed12fd66cf6dfccb414f744e2bbf5f16a92f27a0b')

prepare() {
  cd "qview-$pkgver"  # GitHub names the archive's folder after the repository
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "qview-$pkgver"  # GitHub names the archive's folder after the repository
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "qview-$pkgver"  # GitHub names the archive's folder after the repository
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release -p uqview-core
}

package() {
  cd "qview-$pkgver"  # GitHub names the archive's folder after the repository
  DESTDIR="$pkgdir" scripts/install-files.sh
}
