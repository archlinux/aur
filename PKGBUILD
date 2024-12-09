# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=pw-capture
pkgname=lib32-${_pkgbase}-git
pkgver=r35.a2842f1
pkgrel=1
pkgdesc="Vulkan/OpenGL (game) capture for PipeWire"
url="https://github.com/EHfive/${_pkgbase}"
license=(MIT Apache)
arch=(x86_64)
makedepends=(git meson rust lib32-rust-libs clang lib32-libpipewire lib32-libffi)
depends=(libpipewire-0.3.so lib32-pipewire libffi.so)
provides=(lib32-pw-capture)
optdepends=(
  'lib32-vulkan-icd-loader'
  'lib32-libglvnd'
)
source=(
  "git+https://github.com/EHfive/${_pkgbase}.git"
)
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd $_pkgbase
  (
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  # make AUR helper happy
  rm -rf builddir || true

  cd $_pkgbase

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME=../builddir/cargo-home
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  export RUSTUP_TOOLCHAIN=stable
  arch-meson $_pkgbase builddir \
    --libdir=lib32 \
    -D profile=release \
    -D frozen=true \
    -D target=i686-unknown-linux-gnu

  meson install -C builddir --destdir "$srcdir/destdir"
}

package() {
  cp -r destdir/. "$pkgdir"

  (
    cd "$pkgdir"
    rm -rf usr/{share,bin}
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "${_pkgbase}/LICENSE-MIT"
}
