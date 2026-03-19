# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=nightingale-git
pkgver=0.3.3.r2.g3a3977d
pkgrel=1
pkgdesc="Machine learning powered Karaoke app (with scores!)"
arch=('x86_64')
url="https://github.com/rzru/nightingale"
license=('GPL-3.0-or-later')
depends=('glibc' 'systemd-libs' 'libgcc' 'alsa-lib')
makedepends=('cargo' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	#cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
}
