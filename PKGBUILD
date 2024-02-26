# Maintainer: Gabriel Felix <5u67q32x@duck.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: nullcoder

_pkgname=wmenu
pkgname="$_pkgname-run"
pkgver=0.1.6
pkgrel=1
pkgdesc="wmenu with a wmenu_run script patch applied"
arch=('x86_64')
url="https://git.sr.ht/~adnano/wmenu"
license=('MIT')
makedepends=(
	'meson'
	'ninja'
	'scdoc'
	'wayland-protocols'
)
depends=(
	'libcairo.so'
	'libxkbcommon.so'
	'libpango-1.0.so'
	'libwayland-client.so'
)
provides=('wmenu')
conflicts=('wmenu')
source=(
	"$_pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz"
	"add-wmenu-run.patch"
)
b2sums=('f624773e29c751cb0d890d428482019bab35af1d3f540a53233307d30955dd5936a3eab483be7dac471aab6a85a4cd1953d9a75f095130316a13f96684d52477'
	'eca8709e45402044d6df8cff62e03573f669b432a040554eee12d2105b51780d66b5611828c8537ee69d8a3d1c2e2bb06896a3fe20ebefb2299ad903ff89b1bf')

build() {
	cd "$_pkgname-$pkgver"
	arch-meson build
	ninja -C build
}

prepare() {
	cd "$_pkgname-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/add-wmenu-run.patch"
}

package() {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	chmod 655 "$pkgdir/usr/bin/wmenu_run"
}

