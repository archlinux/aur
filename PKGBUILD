# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=gmlgcd
pkgver=2.4
pkgrel=1
pkgdesc='The gemlog comment daemon'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~shtrophic/gmlgcd'
license=('AGPL-3.0-or-later')
makedepends=('meson' 'scdoc')
checkdepends=('fish')
depends=(
    'confuse'
    'curl'
    'imsg-compat'
    'libbsd'
    'libevent'
)

backup=('etc/gmlgcd.conf' 'etc/gmlgcd.conf.d/help-template.gmi')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	"sysusers-gmlgcd.conf"
        "tmpfiles-gmlgcd.conf"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('5270e7d7af4ad7f4885f72b2c636ae577853a001735b6a292378265ab390c55a'
            'SKIP'
            'e071442fbd90cf80ce528344d4849f6372c8e75d236f3dca9a56c03f3586d92d'
            'd5414cc42d81608d0d8267d3d2d1e7ef7323abdecf96a33af54bae9416f0050e')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|/usr/local|/usr|g' "$pkgname.service"
	meson subprojects download
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	meson setup builddir --buildtype release --prefix=/usr --wrap-mode=nodownload
	meson compile -C builddir
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	meson test -C builddir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C builddir --destdir "$pkgdir" --skip-subprojects foocgi

	install -Dm 644 gmlgcd.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/sysusers-gmlgcd.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
        install -Dm 644 "$srcdir/tmpfiles-gmlgcd.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm 640 gmlgcd.conf -t "$pkgdir/etc"
	install -Dm 644 help-template.gmi -t "$pkgdir/etc/$pkgname.conf.d"

	install -Dm 644 template.gmi README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
