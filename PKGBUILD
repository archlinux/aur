# Maintainer: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.2.1
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64" "riscv64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL-3.0-or-later")
depends=("libadwaita" "libclapper" "libclapper-gtk" "gst-plugins-gtuber")
makedepends=("blueprint-compiler" "cargo" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/$pkgver/pipeline-$pkgver.tar.gz")
sha256sums=('61788e2ce87557c28c5227685487500a7a572edec8b59d00a922dad36777869d')
options=(!lto)

prepare() {
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
