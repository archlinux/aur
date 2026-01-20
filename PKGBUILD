# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
# Ex-Maintainer: Bao <qubidt at gmail dot com>
# Ex-Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=8.0-beta.26+cc95b9374
pkgver="${_pkgver//[-+]/_}"
pkgrel=1
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.zotero.org/support/dev_builds"
conflicts=('zotero')
provides=('zotero')
license=('AGPL3')
depends=(
	'dbus-glib'
	'desktop-file-utils'
	'gtk3'
	'libxt'
	'nss'
)
source=('zotero-absolute-path-fix.patch')
source_x86_64=("Zotero-${_pkgver}_linux-x86_64.tar.xz::https://download.zotero.org/client/beta/${_pkgver//+/%2B}/Zotero-${_pkgver//+/%2B}_linux-x86_64.tar.xz")
source_i686=("Zotero-${_pkgver}_linux-i686.tar.xz::https://download.zotero.org/client/beta/${_pkgver//+/%2B}/Zotero-${_pkgver//+/%2B}_linux-i686.tar.xz")
source_aarch64=("Zotero-${_pkgver}_linux-aarch64.tar.xz::https://download.zotero.org/client/beta/${_pkgver//+/%2B}/Zotero-${_pkgver//+/%2B}_linux-arm64.tar.xz")
sha256sums=('2ef0a68483c4beaa18922cc88f13ad1a7239f7d4c460d8a5d4838a02ca419c28')
sha256sums_x86_64=('a74efa3c8288dc2eec1b5bd07fa7fd35f1c31ece98271851b04738e5f67f6812')
sha256sums_i686=('b9981dc0e87c84a736900a7341fb2ea2a1b86be7dafc5f5c3505069a9951ad6a')
sha256sums_aarch64=('f1ac19be01d90b75e1bfe368c49afc2384999638a4cef9e70453f82924982f40')

prepare() {
    if [[ "$CARCH" == "aarch64" ]]; then
        mv ${srcdir}/Zotero_linux-arm64 ${srcdir}/Zotero_linux-aarch64
    fi
	patch --directory="Zotero_linux-${CARCH}" --forward --strip=1 --input="${srcdir}/zotero-absolute-path-fix.patch"
}

package() {
	install -dDm755 "${pkgdir}"/usr/{bin,lib,share/applications}
	mv -nT "${srcdir}/Zotero_linux-${CARCH}" "${pkgdir}"/usr/lib/zotero
	ln -s /usr/lib/zotero/zotero "${pkgdir}"/usr/bin/zotero
	ln -s /usr/lib/zotero/zotero.desktop "${pkgdir}"/usr/share/applications/zotero.desktop

	# Copy zotero icons to a standard location
	install -Dm644 "${pkgdir}"/usr/lib/zotero/icons/icon32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/zotero.png
	install -Dm644 "${pkgdir}"/usr/lib/zotero/icons/icon64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/zotero.png
	install -Dm644 "${pkgdir}"/usr/lib/zotero/icons/icon128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/zotero.png
	install -Dm644 "${pkgdir}"/usr/lib/zotero/icons/symbolic.svg "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps/zotero-symbolic.svg
}
