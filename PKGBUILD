# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=(red-{view,cli,toolchain})
pkgbase=red-meta
_pkgver='30dec23-f8f255970'
pkgver="$(date -d ${_pkgver%%-*} '+%Y.%m.%d').${_pkgver##*-}"
pkgrel=1
pkgdesc="Red is a next-generation programming language strongly inspired by REBOL"
arch=('i686' 'x86_64')
depends=(lib32-curl)
makedepends=('gendesk' 'curl')
url="https://www.red-lang.org"
license=('custom:BSD-3-Clause' 'custom:BSL-1.0')
source=(
	"red-view::https://static.red-lang.org/dl/auto/linux/red-view-$_pkgver"
	"red-cli::https://static.red-lang.org/dl/auto/linux/red-$_pkgver"
	"red-toolchain::https://static.red-lang.org/dl/auto/linux/red-toolchain-$_pkgver"
)
sha256sums=('2b264cea7e0284a456ce669c402151be6605db0d765cff65d6aa86ae5c262885'
	'6b73db6e4a891d4cc443fdf2475f07c32d14f9a4a91330d46d3376872640df53'
	'71761e2459209c1de8f6d9f3102f6728ad38ce7fc7db1cd85aef279569abf518')

package_red-view() {
	pkgdesc="$pkgdesc (GUI)"
	groups=(red-bin)
	depends+=(lib32-gtk3)
	curl --retry 3 --silent -O https://static.red-lang.org/red-logo.svg
	gendesk -f -n --pkgname="$pkgname" \
		--pkgdesc="Red interpreter + View + GUI console" \
		--exec="$pkgname" \
		--icon='red' \
		--name='Red GUI' \
		--categories="Development;GUIDesigner"

	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "red-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/red.svg"
}

package_red-cli() {
	pkgdesc="$pkgdesc (CLI)"
	groups=(red-bin)
	provides=(red)
	conflicts=(red)
	depends+=(lib32-gdk-pixbuf2)
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
}

package_red-toolchain() {
	pkgdesc="$pkgdesc (Compiler)"
	groups=(red-bin)
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/redc"
}
