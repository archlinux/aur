# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-git
pkgver=0.6.2.r4.g5091a82
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig')
makedepends=('cargo' 'git' 'clang')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver(){
	cd "$srcdir/${pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 "$srcdir/${pkgname}/target/release/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
}
