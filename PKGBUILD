# Maintainer: Sir-Photch <sir-photch at posteo dot me>

pkgname=gmlgcd
pkgver=1.4
pkgrel=1
pkgdesc='The gemlog comment daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/Sir-Photch/gmlgcd'
license=('AGPL-3.0-or-later')
makedepends=('meson')
checkdepends=('fish')
depends=('libevent' 'libbsd' 'confuse')

backup=('etc/gmlgcd.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Sir-Photch/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"sysusers-gmlgcd.conf"
)
sha256sums=('996e33564021219b29925ab1fe852c2c989bd395eb453774032bfeb2ed3d05a9'
            'e071442fbd90cf80ce528344d4849f6372c8e75d236f3dca9a56c03f3586d92d')

prepare() {
	sed -i 's|/usr/local|/usr|g' "$srcdir/$pkgname-$pkgver/$pkgname.service"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	meson setup builddir --buildtype release --prefix=/usr
	meson compile -C builddir
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	meson test -C builddir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C builddir --destdir "$pkgdir"

	install -Dm 644 gmlgcd.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/sysusers-gmlgcd.conf" "$pkgdir/usr/lib/sysusers.d/gmlgcd.conf"

	install -Dm 644 gmlgcd.conf -t "$pkgdir/etc"

	install -Dm 644 template.gmi README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
