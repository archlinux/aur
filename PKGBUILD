# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=greetd-ddlm-git
pkgver=r23.d8d1b24
pkgrel=2
pkgdesc="deathowl's dummy login manager"
arch=('x86_64')
url="https://github.com/deathowl/ddlm"
license=('GPL-3.0')
depends=('greetd')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("Remove-osstrtools.patch"
	"$pkgname::git+$url")
sha256sums=('f8f63b04b91479df52ea8ec3ff9742b3af860222b30aaaa3310d6cffaf7d985a'
            'SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch --directory="$pkgname" --forward --strip=1 --input="${srcdir}/Remove-osstrtools.patch"
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/ddlm -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
