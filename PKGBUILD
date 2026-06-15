# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=xodus-git
pkgver=r65.11dd5a0
pkgrel=1
pkgdesc="The great gaming migration to Linuxc"
arch=('x86_64')
url="https://github.com/xodus-gaming/xodus"
license=('GPL-3.0-or-later')
depends=('openssl' 'gdk-pixbuf2' 'glibc' 'dbus' 'webkit2gtk-4.1' 'glib2' 'gtk3' 'libgcc' 'libsoup3' 'cairo')
makedepends=('cargo' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
options=(!lto)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	# Todo: change this into the tag system when stable point builds are released!
	cd "$srcdir/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/${pkgname::-4}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${pkgname::-4}"
}

package() {
	cd "$srcdir/${pkgname::-4}"
	install -Dm755 target/release/xodus-cli "${pkgdir}/usr/bin/${pkgname::-4}-cli"
	install -dm755 "${pkgdir}/usr/share/doc"
	cp -a docs/ "${pkgdir}/usr/share/doc/${pkgname::-4}"
}
