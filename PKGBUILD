# Maintainer: Hayake <youremail@domain.com>
pkgname=estrace-git
pkgver=0.2.2.r0.gd8fef85
pkgrel=1
pkgdesc="A tool that traces system calls using eBPF"
arch=('x86_64' 'aarch64')
url="https://github.com/ri-char/eStrace"
license=('GPL')
depends=()
makedepends=('git' 'lld' 'rust')
provides=('estrace')
source=("git+https://github.com/ri-char/eStrace.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/eStrace"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	rustup target add ${arch}-unknown-linux-musl
}
build() {
	cd "$srcdir/eStrace"

	cargo xtask build --release
	cargo xtask build --arch aarch64-unknown-linux-musl --release
}

package() {
	cd "$srcdir/eStrace"
	install -Dm 755 "target/$arch-unknown-linux-musl/release/estrace" "$pkgdir/usr/bin/estrace"
	install -Dm 644 "README.md" "$pkgdir/usr/share/doc/estrace/README.md"
}
