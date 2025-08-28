# Maintainer: Herbert Rusznak <herbert.rusznak@gmail.com>
# Contributor: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=stl-thumb-git
pkgver=238.6f4dd55
pkgrel=4
license=('MIT')
pkgdesc="A fast lightweight thumbnail generator for STL files"
url="https://github.com/unlimitedbacon/stl-thumb.git"
source=("${pkgname}::git+https://github.com/unlimitedbacon/stl-thumb.git")
depends=("libgl" "freetype2" "fontconfig" "xorg-server-xvfb")
makedepends=("rust" "git")
provides=("stl-thumb")
conflicts=("stl-thumb")
arch=("i386" "x86_64")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	# Remove cargo config
	# This file has gcc paths specifically for building on Debian/ARM
	# Removing it allows this package to build on Arch Linux Arm
	rm .cargo/config.toml

	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 target/release/stl-thumb       "${pkgdir}/usr/bin/stl-thumb"
	install -Dm755 target/release/libstl_thumb.so "${pkgdir}/usr/lib/libstl_thumb.so"
	install -Dm644 target/release/libstl_thumb.a  "${pkgdir}/usr/lib/libstl_thumb.a"
	install -Dm644 stl-thumb.thumbnailer          "${pkgdir}/usr/share/thumbnailers/stl-thumb.thumbnailer"
	install -Dm644 libstl_thumb.h                 "${pkgdir}/usr/include/libstl_thumb.h"
}
