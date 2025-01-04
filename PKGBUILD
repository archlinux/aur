# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=gmlghd
pkgver=0.9
pkgrel=1
pkgdesc='The gemlog http daemon'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~shtrophic/gmlghd'
license=('AGPL-3.0-or-later')
makedepends=('git' 'meson')
depends=(
    'confuse'
    'libbsd'
    'libevent'
    'libretls'
)
optdepends=(
    'nginx: fastcgi reverse proxy'
)

backup=('etc/gmlghd.conf')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	"sysusers-$pkgname.conf"
	"tmpfiles-$pkgname.conf"
	"mime.types"
	"$pkgname.example.conf"
	"$pkgname.service"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('2df07d8498a8367c6aabd494b19fcb1371bf94e7d4f4a5fc575d9f657262698a'
            'SKIP'
            'a73c3d9a9798c307b70be4e764cb7023dd7a0ab4a21c906e72663a7cb45ebaf2'
            '99fe77ece238d533bba8e849c4b830d534e8ccc193cf9e291af257f60180823d'
            '27040f1df57b570b3117bd30ceb5685fbfa5aba61108f37cf86f0304d4f29f09'
            'c3d26f48b57bf51b33ef9f1dded4270b439cfa5a6642186071a64affc44c1494'
            '8670d6546ba6501641b386ba72469c0f9e8c6e8853434a8e98b766cf3dfba0f5')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	meson subprojects download
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	meson setup builddir --buildtype release --prefix=/usr --wrap-mode=nodownload
	meson compile -C builddir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	meson install -C builddir --destdir "$pkgdir" --skip-subprojects foocgi

	install -Dm 644 "$srcdir/sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm 644 "$srcdir/tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm 644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

	install -Dm 640 "$srcdir/$pkgname.example.conf" "$pkgdir/etc/$pkgname.conf"
	install -Dm 644 "$srcdir/mime.types" -t "$pkgdir/usr/share/$pkgname"

	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
