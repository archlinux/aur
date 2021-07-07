# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=(amber-bridge firefox-extension-amber-bridge)
_pkgname=amber-bridge
pkgver=0.2.0
pkgrel=1
pkgdesc='Bring the Unix philosophy to the browser.'
arch=(x86_64)
url=https://github.com/paysonwallach/amber-bridge
license=('GPL')
depends=(
	glib2
	gtk3
	json-glib
	libgee
)
makedepends=(
	jq
	meson
	vala
)
source=("https://github.com/paysonwallach/amber-bridge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7389c5abb8edf1ccf24ae793e0d41e346990f37463c8e446d01fc328ac50614a')

build() {
	arch-meson --wrap-mode default "${_pkgname}-${pkgver}" build
	meson compile -C build
}

package_amber-bridge() {
	DESTDIR="${pkgdir}" meson install --skip-subprojects -C build
}

package_firefox-extension-amber-bridge() {
	depends=(amber-bridge)

	install -dm755 "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/"
	jq '.path = "/usr/lib/com.paysonwallach.amber.bridge"' "${_pkgname}-${pkgver}/data/com.paysonwallach.amber.bridge.json" \
	> "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/com.paysonwallach.amber.bridge.json"
}
