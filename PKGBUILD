# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=(red-{view,cli,toolchain})
pkgbase=red-meta
_pkgver='23jan26-23418b4cb'
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
sha256sums=('35abcc3a02534c5e538fa0829caac15bef61878b3b228c32135b34a469dad1d7'
            '3fe435e602f822e224b526c3760e448d2a28399a915d2b09cd0bde030a0b7246'
            '810a42b64a085e30b464659a96c19cb334e44d9f5a35da416519254f758984cd')

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
