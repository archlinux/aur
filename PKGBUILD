# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

_pkgname=purl
pkgname="$_pkgname"-git
pkgver=0.1.0.r4.g0728456
pkgrel=1
pkgdesc="A curl-esque CLI for making HTTP requests that require payment. Designed for humans and agents alike."
arch=('any')
url="https://github.com/stripe/purl"
license=('MIT')
options=(!lto)
makedepends=('git' 'rust')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    git describe --tags --long | \
        sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$srcdir/$pkgname"
	cargo clippy -- -D warnings
	cargo test
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
