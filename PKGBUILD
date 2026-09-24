# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=lovely-injector
pkgver=0.10.0
pkgrel=1
pkgdesc='A runtime lua injector for games built with LÖVE'
url='https://github.com/ethangreen-dev/lovely-injector'
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=(glibc libgcc libstdc++)
depends_i686=(glibc libgcc libstdc++)
makedepends=(
  git
  cargo
  cmake
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethangreen-dev/lovely-injector/archive/refs/tags/v$pkgver.tar.gz"
        "dobby::git+https://github.com/jmpews/Dobby.git#commit=0932d69c320e786672361ab53825ba8f4245e9d3")
sha256sums=('348c25f35bf34b81aac6c17571934a54996fdef5ed3c246e5c3c4e83b8a013d3'
            'ff3c03ed50d42f1b8b26517fb8d43c0b474bcfe89d56227bb6a48b5661e6e482')
b2sums=('4fe2baafd485ca2fcb70349431d8e068142c6e6154966ae4517598dd68c20b7861b321d0aa8e8b5f777554b6cb38035e66f92b600d8bcf768a04c745983f3713'
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
