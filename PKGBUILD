# Maintainer: chadsr <git at ross dot ch>

pkgname=libpostal
pkgver=1.1.4 # renovate: datasource=github-tags depName=openvenues/libpostal
pkgrel=3
pkgdesc="A C library for parsing/normalizing street addresses around the world"
url="https://github.com/openvenues/libpostal"
license=("MIT")
arch=("x86_64" "aarch64")
install="$pkgname.install"
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('65737168426f3e4d5be1a815d1c3d9ffe0e2cb32378d04966cab46472da51dcc725488c4fa2ae759a751f10d2443ec7ba0e6a3cb599f2e10c9acdb2f12b35ce9')

build() {
	cd "$pkgname-$pkgver"

	local _sse2
	case "$CARCH" in
	x86*) _sse2="" ;;
	*) _sse2="--disable-sse2" ;;
	esac

	./bootstrap.sh
	./configure --disable-data-download --prefix=/usr --datadir=/var/lib $_sse2

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -d "$pkgdir/var/lib/libpostal"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
