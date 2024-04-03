# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=radius2-git
_reponame=radius
pkgver=v1.0.16.r30.gbf92f44
pkgrel=1
pkgdesc='fast binary emulation and symbolic execution framework using radare2'
arch=('x86_64')
url="https://github.com/aemmitt-ns/$_reponame"
license=('MIT')
depends=('boolector' 'radare2' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" Cargo.toml.patch)
sha256sums=('SKIP'
            '5d10a10a3a75927e0d728eaa0120aceab9c4f7258d46268ecb07acc5b111fc16')

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_reponame"

	# For some reason, --no-default-features does not work,
	# we need to patch the feature out so that cargo does not attempt
	# to build lingeling for boolector
	patch -p0 < "$srcdir"/Cargo.toml.patch

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_reponame"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/radius2"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
