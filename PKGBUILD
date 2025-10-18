# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname=icann-rdap
pkgver=0.0.24
pkgrel=1
pkgdesc='ICANN implementation of the Registry Data Access Protocol (RDAP)'
arch=('aarch64' 'x86_64')
url='https://github.com/icann/icann-rdap'
license=('Apache-2.0 OR MIT')  # SPDX-License-Identifier: Apache-2.0 OR MIT
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=('rdap')
conflicts=('rdap')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53121b4caa1bdbc61ca2a122b7b915035553618616b9c47095821a9391aceddf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    target/release/rdap{,-srv{,-{data,store,test-data}},-test}

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  for _xxx in cli client common srv; do
    install -vDm0644 "icann-rdap-$_xxx/README.md" \
       "$pkgdir/usr/share/doc/$pkgname/README-$_xxx.md"
  done
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-*
}
