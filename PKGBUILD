# Maintainer: Kevin López Brante <kevin@kddlb.cl>
pkgname=ajuste-git
_pkgname=ajuste
pkgver=r7.97db83b
pkgrel=1
pkgdesc='Native control panel and CLI for the Fractal Scape wireless headset (battery, EQ, lighting, sidetone, ENC)'
arch=(x86_64 aarch64)
url='https://github.com/kddlb/ajuste'
license=('MIT OR Apache-2.0')
depends=(gcc-libs glibc libxcb libxkbcommon libxkbcommon-x11 wayland vulkan-icd-loader)
makedepends=(cargo git)
optdepends=('libglvnd: EGL fallback when Vulkan is unavailable')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=ajuste.install
# GCC LTO turns the C shims some crates build (wayland-backend) into IR rust-lld cannot link.
options=(!lto)
source=("$_pkgname::git+https://github.com/kddlb/ajuste.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make build CARGO_FLAGS=--frozen
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p scape-proto -p ajuste
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
