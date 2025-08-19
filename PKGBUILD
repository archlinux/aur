# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: nangidev: <>
_pkgname=Epic-Asset-Manager
pkgname=epic-asset-manager
pkgver=3.8.6
pkgrel=2
pkgdesc="A frontend to Assets purchased on Epic Games Store"
arch=('x86_64')
url="https://github.com/AchetaGames/Epic-Asset-Manager"
license=('MIT')
depends=('glibc' 'gcc-libs' 'gtk4' 'gdk-pixbuf2' 'graphene' 'openssl' 'pango' 'bzip2' 'cairo' 'glib2' 'libadwaita' 'hicolor-icon-theme' 'dconf')
makedepends=('cargo' 'meson')
provides=(eam)
conflicts=(eam)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c0ea9a9c7b4c82ac13514887dc608132816fb1eeb5b1e4c1619ea20412e2fc5')

prepare() {
	cd "$srcdir"
	if [ -d build ]; then rm -rf build; fi
}

build() {
	cd "$srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	arch-meson \
	$_pkgname-$pkgver \
	build

	meson compile -C build
}

package() {
	cd "$srcdir"

	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	meson install -C build --destdir "$pkgdir"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
