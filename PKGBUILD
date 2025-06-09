# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=lovely-injector
pkgver=0.8.0
pkgrel=2
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
sha256sums=('329d2f463360a939b9a8a05281541e81d816932c0cc837ccde6bedc4dbf55ca6'
            'ff3c03ed50d42f1b8b26517fb8d43c0b474bcfe89d56227bb6a48b5661e6e482')
b2sums=('73df00e113d811e3e77be01f68ca91f9d07208662e9d7fdbf2ba67dc5167e393b8c1c116289af4c7b693ca710ded9f792a7a6a12a7375091711e58f85be5104b'
        '17430c58cd1efba07e93376e3e897160baec50ab874e83a27103d1a51e748aaa68e10c21344c676d50c4abd2566064aa0329228e289a2f5319b51723b3396766')
options=(!lto)

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

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
