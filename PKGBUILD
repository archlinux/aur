# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=1.2.4
pkgrel=1
pkgdesc='The full-stack edge platform for your edge oriented applications'
arch=('x86_64')
url='https://www.edgee.cloud'
license=('Apache-2.0')
depends=('openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-cloud/edgee/archive/v$pkgver.tar.gz")
sha256sums=('565aed6c9557bdd928ef9e8235687ae20fbbdb17fe5b856c99e1a35f84cef9df')
b2sums=('7046a737578fe4cf8b8e26708c94e1e8f8c384d9b8489994728b993adb5bfe36a5cae985997ee13d6552dff8186bc3ca7e7781f5a90c1795f30d4a94c34d2700')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
