# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: nangidev: <>
_pkgname=Epic-Asset-Manager
pkgname=epic-asset-manager
pkgver=3.9.2
pkgrel=1
pkgdesc="A frontend to Assets purchased on Epic Games Store"
arch=('x86_64')
url="https://github.com/AchetaGames/Epic-Asset-Manager"
license=('MIT')
depends=('glibc' 'libgcc' 'gtk4' 'graphene' 'openssl' 'glib2' 'libadwaita' 'hicolor-icon-theme' 'dconf')
makedepends=('cargo' 'meson')
provides=(eam)
conflicts=(eam)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('44083a39a1225bc54c2755a87647aa310370f6c5428088a528c7ea676c3a9b63')

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
