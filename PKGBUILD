# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=leaf-git
pkgver=0.2.11.r13.g5b1582f
pkgrel=2
pkgdesc="A lightweight and fast proxy utility tries to include any useful features."
arch=(x86_64 aarch64)
url="https://github.com/eycorsican/leaf"
license=('custom:Apache-2.0')
depends=(gcc-libs)
makedepends=(git cargo)
provides=(leaf)
conflicts=(leaf)
source=("${pkgname%-git}::git+$url")
b2sums=(SKIP)

pkgver() {
    cd "$srcdir"/"${pkgname%-git}"  
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"/"${pkgname%-git}"
    git submodule update --init --recursive
}
    
build() {
	cd "$srcdir"/"${pkgname%-git}"
	cargo +nightly build --release -p leaf-bin
}

package() {
	cd "$srcdir"/"${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}/
	install -Dm644 README{,.zh}.md -t "$pkgdir"/usr/share/doc/${pkgname%-git}/
	install -Dm755 target/release/${pkgname%-git} -t "$pkgdir"/usr/bin/
}
