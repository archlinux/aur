# Maintainer: NorthWestWind

_pkgname=fuzzel
pkgname=$_pkgname-noncompliant
pkgver=1.13.1
pkgrel=1
pkgdesc='Application launcher for wlroots based Wayland compositors, with non-compliant quote argument support'
url="https://codeberg.org/dnkl/$_pkgname"
arch=(x86_64)
license=(MIT)
depends=(cairo
         fcft
         fontconfig
         libfcft.so
         libpng
         libxkbcommon
         pixman
         wayland
         librsvg)
makedepends=(meson
             scdoc
             tllist
             wayland-protocols)
provides=(fuzzel)
conflicts=(fuzzel)
backup=('etc/xdg/fuzzel/fuzzel.ini')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" "non-compliant.patch")
sha256sums=('17e8f01753469573965a2a37b5745d03e6f6e7bda9d675cd2bc4644abb42d818'
            '8c911b0ecd404e4edc76100c74e04e79876b63e7df6bd732fd174f61cceea5f9')

prepare() {
	cd "$_pkgname"
    patch -Np1 -i ../non-compliant.patch
}

build() {
	cd "$_pkgname"
	arch-meson \
		-Denable-cairo=enabled \
		-Dpng-backend=libpng \
		-Dsvg-backend=librsvg \
		. build
	meson compile -C build
}

package() {
	cd "$_pkgname"
	meson install -C build --destdir "$pkgdir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
