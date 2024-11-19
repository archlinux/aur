# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=gmlgcd
pkgver=2.1
pkgrel=1
pkgdesc='The gemlog comment daemon'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~shtrophic/gmlgcd'
license=('AGPL-3.0-or-later')
makedepends=('meson' 'scdoc')
checkdepends=('fish')
depends=('libevent' 'libbsd' 'confuse')

backup=('etc/gmlgcd.conf' 'etc/gmlgcd.conf.d/help-template.gmi')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	"sysusers-gmlgcd.conf"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('651003875fa09dcfd2129071e7c15154342efbde821396807e9b6565cbee05dc'
            'SKIP'
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
	install -Dm 644 help-template.gmi -t "$pkgdir/etc/gmlgcd.conf.d"

	install -Dm 644 template.gmi README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
