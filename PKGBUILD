# Maintainer: Marcus Rosado <22052802+marcusbandit@users.noreply.github.com>
# The AUR's anibeam: the native Qt shell built from a release tag. Publish it with
# apps/linux/packaging/aur/publish.sh after the tag is on GitHub.
pkgname=anibeam
pkgver=2.5.1
pkgrel=1
pkgdesc="Browse, play and track a local anime library (Qt 6 and libmpv)"
arch=(x86_64 aarch64)
url="https://github.com/marcusbandit/Anibeam"
license=(GPL-3.0-or-later)
# anirss and qbittorrent-nox are the Downloads page's: Anibeam runs both itself, and uses a
# qBittorrent you already run instead when one answers.
depends=(qt6-base qt6-declarative qt6-svg mpvqt mpv gcc-libs glibc hicolor-icon-theme
         'anirss>=0.6.0' qbittorrent-nox)
makedepends=(rust)
optdepends=(
  'org.freedesktop.secrets: tracker sign-ins kept in the keyring rather than a file'
)
# makepkg's lto option puts -flto=auto into CXXFLAGS; cc-rs hands it to g++, and rustc's
# link step never asks for LTO, so the GCC LTO objects come back as undefined C++ bridge
# symbols. Rust's own LTO is a Cargo profile matter, not a makepkg one.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39cfd8c219fd5c7be74b9a5c6a3adc2f1d68e73338dd82cd1e075093db95b7e1')

_src() { cd "$srcdir/Anibeam-$pkgver"; }

prepare() {
  _src
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _src
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The version comes from git describe when there is a checkout. A tarball has none, so
  # keep git from finding whatever repository the build directory sits in (an AUR clone)
  # and let the binary say the Cargo version, which is the tag's.
  export GIT_CEILING_DIRECTORIES="$srcdir"
  # A release built from source: the release icon, not the dev one a checkout gets.
  export ANIBEAM_ICON=release
  cargo build --frozen --release -p anibeam
}

check() {
  _src
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export GIT_CEILING_DIRECTORIES="$srcdir"
  export ANIBEAM_ICON=release
  cargo test --frozen --release -p anibeam
}

package() {
  _src
  # The same tree the anibeam-bin tarball holds: install-tree.sh lays out both.
  apps/linux/packaging/linux/install-tree.sh . "$pkgdir" target/release/anibeam
}
