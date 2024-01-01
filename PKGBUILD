# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=(red-{view,cli,toolchain})
pkgbase=red-meta
_pkgver='31dec23-f61506be0'
_pkgcommit="${_pkgver##*-}"
pkgver="$(date --date="${_pkgver%%-*}" "+%Y.%m.%d.${_pkgver##*-}")"
pkgrel=1
pkgdesc="Red is a next-generation programming language strongly inspired by REBOL"
arch=('i686' 'x86_64')
depends=(lib32-curl)
makedepends=('gendesk' 'curl')
url="https://www.red-lang.org"
license=('custom:BSD-3-Clause' 'custom:BSL-1.0')
source=(
	"red-view-$_pkgver::https://static.red-lang.org/dl/auto/linux/red-view-$_pkgver"
	"red-cli-$_pkgver::https://static.red-lang.org/dl/auto/linux/red-$_pkgver"
	"red-toolchain-$_pkgver::https://static.red-lang.org/dl/auto/linux/red-toolchain-$_pkgver"
)
sha256sums=('905a3346995c4b2402d382c3919631ff9059e3aaba286207df4d50c91fc2192e'
	'3c66857c912473a53b720f0f2bc7cb17000ed828010344b3e180c586302c425b'
	'007788d933e90f7ae221d0801e6f908787ec7b7c7bb18ebcd0daf480c72a3aa8')

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

	install -Dm755 "$pkgname-$_pkgver" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "red-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/red.svg"
}

package_red-cli() {
	pkgdesc="$pkgdesc (CLI)"
	groups=(red-bin)
	provides=(red)
	conflicts=(red)
	depends+=(lib32-gdk-pixbuf2)
	install -Dm755 "$pkgname-$_pkgver" "$pkgdir/usr/bin/$pkgname"
}

package_red-toolchain() {
	pkgdesc="$pkgdesc (Compiler)"
	groups=(red-bin)
	install -Dm755 "$pkgname-$_pkgver" "$pkgdir/usr/bin/redc"
}
