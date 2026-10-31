# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=openrig
pkgname=$_name-git
pkgver=r107.e15c209
pkgrel=1
pkgdesc="Guitar multi-effects pedalboard."
arch=(x86_64 aarch64)
url="https://github.com/Siryu6/$_name"
license=(GPL-3.0)
depends=(pipewire-jack
         lilv)
makedepends=(cargo
             cmake
             git)
options=(!lto)
provides=($_name)
conflicts=($_name)
source=("git+$url.git"
        "$_name.desktop")
sha256sums=('SKIP'
            'eb2acb2f52d7a46760f1cbf68f7bc5e01d07bacbccf7b288497626d9fb621deb')

prepare() {
  cd "$srcdir/$_name"
  git submodule update --init --recursive
  cargo fetch --locked --target host-tuple
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_name"
  cargo test --frozen
}

package() {
  install -Dm0755 "$srcdir/$_name/target/release/pedalboard" "$pkgdir/usr/bin/$_name"
  install -Dm644 "$srcdir/$_name/LICENSE" -t "$pkgdir/usr/share/licenses/$_name"
  install -Dm644 "$_name.desktop" -t "$pkgdir/usr/share/applications"
}
