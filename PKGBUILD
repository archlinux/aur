# Maintainer: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.4.1
pkgrel=2
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64" "riscv64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL-3.0-or-later")
depends=("libadwaita" "libclapper" "libclapper-gtk" "clapper-enhancers")
makedepends=("blueprint-compiler" "cargo" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('7f6bc0866bcc2a22f662f97d63bb97f8c75ad04754022a4709588cf88651a0ba')
options=(!lto)

prepare() {
	cd pipeline-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	arch-meson pipeline-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"

	ln -s tubefeeder "$pkgdir"/usr/bin/pipeline
}
