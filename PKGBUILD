# Maintainer: fossdd <fossdd@pwned.life>

pkgname=bpftop-git
_pkgname=${pkgname%-git}
pkgver=r44.40184fb
pkgrel=1
pkgdesc="bpftop provides a dynamic real-time view of running eBPF programs"
url='https://github.com/Netflix/bpftop'
license=(Apache-2.0)
arch=(x86_64)
depends=(glibc libelf gcc-libs zlib)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
}
