# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yuioto <yuiotochan@outlook.com>
# Contributor: Shunsuke Shibayama <sbym1346@gmail.com>

pkgname=erg
pkgver=0.6.38
pkgrel=1
pkgdesc='Statically typed language that builds upon the Python ecosystem'
url='https://github.com/erg-lang/erg'
license=('MIT' 'Apache')
arch=('x86_64')
depends=('python')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('158012b3eb0ff38dbf3996d9f78cfa46779ba7029e31447bc751843257e5ed8c')

## We don't turn on --all-features here because they change the language
## of the error messages

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
