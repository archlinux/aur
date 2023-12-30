# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=(red-{view,cli,toolchain})
pkgbase=red-meta
_pkgver='30dec23-f8f255970'
pkgver="$(date --date="${_pkgver%%-*}" "+%Y.%m.%d.${_pkgver##*-}")"
pkgrel=2
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
sha256sums=('e8933667930e7d57a6278d902820395f1e84b1baecbe8da0cf23fd1b9a62f7ed'
	'0b19fbd55461708e90bca1ea9a249c595293e45e3efcad40e48d6ab31e027a73'
	'ec804aec818b6ce4f7dd455da5b5c2eefe5254ea446053d08367c0322c4e334d')

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
