# Maintainer: Floofy <FloofyIV9@proton.me>

pkgname=rosemary-git
_pkgname=rosemary
pkgver=0.3.0.r10.gfe20d1a
pkgrel=1
pkgdesc="Compatibility layer and high level emulator hybrid for running macOS applications (git version)"
arch=(x86_64)
url="https://github.com/microlift/rosemary"
license=(GPL-3.0-only)
depends=(
  curl
  glibc
  libgcc
  libxkbcommon
  zlib
)
makedepends=(
  cargo
  git
)
optdepends=(
  'openal: OpenAL support'
  'sdl3: For running GUI apps'
  'vulkan-driver: Metal support'
  'vulkan-icd-loader: Metal support'
  'glib-networking: WebView support'
  'webkitgtk-6.0: WebView support'
)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
options=(!lto)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.3.0.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -vDm 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDm 644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
