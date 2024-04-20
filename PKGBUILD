# Maintainer: RiverOnVenus <error@zhui.dev>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=imgcatr-git
pkgver=0.1.4.r3.g4e1d839
pkgrel=1
pkgdesc="A CLI application for displaying images"
arch=('x86_64')
url="https://github.com/SilinMeng0510/imgcatr"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=('imgcatr')
conflicts=('imgcatr')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/imgcatr"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
