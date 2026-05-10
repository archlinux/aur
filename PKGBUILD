# Maintainer: Addison C.S. <floraladdison@proton.me>

_pkgname=nirimap
pkgname=${_pkgname}-git
pkgver=0.2.0.r0.gcbe8504
pkgrel=1
pkgdesc="A minimal workspace minimap overlay for the Niri Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/alexandergknoll/nirimap"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
)
makedepends=(
  'cargo'
  'git'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/alexandergknoll/nirimap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
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
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
