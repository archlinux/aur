# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=lovely-injector
pkgver=0.9.0
pkgrel=1
pkgdesc='A runtime lua injector for games built with LÖVE'
url='https://github.com/ethangreen-dev/lovely-injector'
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=(gcc-libs)
depends_i686=(gcc-libs)
makedepends=(
  git
  cargo
  cmake
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethangreen-dev/lovely-injector/archive/refs/tags/v$pkgver.tar.gz"
        "dobby::git+https://github.com/jmpews/Dobby.git#commit=0932d69c320e786672361ab53825ba8f4245e9d3")
sha256sums=('e6200911ee09e519028ac64e52e6677421a789df4759f883e2576e04979f6535'
            'ff3c03ed50d42f1b8b26517fb8d43c0b474bcfe89d56227bb6a48b5661e6e482')
b2sums=('9dc23028e1e29b32e6e846c3991c462ef61370bbcd81c60e2e2536e0e3013caf152bc0418c60f5563d75edc4596026f1043b674e7e0af5f0a2d508a0a54d5260'
        '17430c58cd1efba07e93376e3e897160baec50ab874e83a27103d1a51e748aaa68e10c21344c676d50c4abd2566064aa0329228e289a2f5319b51723b3396766')
options=(!lto)

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"

  rm -rf crates/dobby-sys/dobby
  ln -s $srcdir/dobby crates/dobby-sys/dobby
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release -p lovely-unix --lib
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/lib" \
    target/release/liblovely.so

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
