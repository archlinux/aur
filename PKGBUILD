# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=gmlghd
pkgver=1.5
_ctkcommit=7791114
_foocgicommit=9575997
pkgrel=2
pkgdesc='The gemlog http daemon'
arch=(x86_64 aarch64)
url='https://git.sr.ht/~shtrophic/gmlghd'
license=('AGPL-3.0-or-later')
makedepends=(git meson scdoc linux-api-headers)
checkdepends=(fish)
depends=(
    glibc
    confuse
    libbsd
    libmd
    libevent
    libretls
)
optdepends=(
    'nginx: fastcgi reverse proxy'
)

backup=('etc/gmlghd.conf')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
	"ctk::git+https://git.sr.ht/~shtrophic/ctk#tag=$_ctkcommit"
	"foocgi::git+https://git.sr.ht/~shtrophic/foocgi#tag=$_foocgicommit"
	"sysusers-$pkgname.conf"
	"tmpfiles-$pkgname.conf"
	"mime.types"
	"$pkgname.example.conf"
	"$pkgname.service"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('166ddd36a4215280f01bf15b1a87d8ee0b2af6a08b8336157a6979e9ba4b01af'
            'SKIP'
            'f80656e2ee8e43515dcb82cef094f08761b2f4d63fc7e0146da457d51056368e'
            '8343f9e563ccfc33f3cc1e60e48580b56315d056e4f4592a7fb8efb4da169300'
            'a73c3d9a9798c307b70be4e764cb7023dd7a0ab4a21c906e72663a7cb45ebaf2'
            '99fe77ece238d533bba8e849c4b830d534e8ccc193cf9e291af257f60180823d'
            '27040f1df57b570b3117bd30ceb5685fbfa5aba61108f37cf86f0304d4f29f09'
            'c3d26f48b57bf51b33ef9f1dded4270b439cfa5a6642186071a64affc44c1494'
            '7a26e5d17796e4adec3f6dc4c22f03b68aab08be403c9d316b3fbac1264cad9f')

prepare() {
	for subproject in ctk foocgi; do
	    rmdir "$pkgname-$pkgver/subprojects/$subproject"
	    ln -rs $subproject "$pkgname-$pkgver/subprojects"
	done
}

build() {
	arch-meson "$pkgname-$pkgver" builddir
	meson compile -C builddir
}

check() {
	meson test -C builddir --print-errorlog
}

package() {
	meson install -C builddir --destdir "$pkgdir" --skip-subprojects foocgi,ctk

	install -Dm 644 "sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm 644 "tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm 644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

	install -Dm 640 "$pkgname.example.conf" "$pkgdir/etc/$pkgname.conf"
	install -Dm 644 "mime.types" -t "$pkgdir/usr/share/$pkgname"

	install -Dm 644 "$pkgname-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "$pkgname-$pkgver/gmlghd.example.conf" -t "$pkgdir/usr/share/doc/$pkgname"
}
