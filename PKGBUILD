# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>
pkgname=ssh-agent-mux
pkgver=0.2.0
pkgrel=3
pkgdesc='Combine keys from multiple SSH agents into a single agent socket'
arch=('x86_64' 'aarch64')
url='https://github.com/overhacked/ssh-agent-mux'
license=('Apache-2.0' 'BSD-3-Clause')
depends=('openssh' 'gcc-libs')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.service"
  "$pkgname.toml.example"
)
sha256sums=('88f89db4a34a46d132f33bff5e33929b909c5f51efb398ab1eb204f4dcd46780'
            'e7999e79aa33c3fd08616ba60af3ce349b8e4ca1864571231accb89d9006215f'
            '6d5ee662f0a38f01575c388bf327822c59fbd4f258963e816a3e617c9beccaf1')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md            "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md         "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 LICENSE.Apache-2.0   "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache-2.0"
  install -Dm644 LICENSE.BSD-3-Clause "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD-3-Clause"

  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.toml.example" "$pkgdir/usr/share/doc/$pkgname/$pkgname.toml.example"
}
