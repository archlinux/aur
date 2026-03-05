# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
# Ex-Maintainer: Bao <qubidt at gmail dot com>
# Ex-Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=9.0-beta.7+c0c9437da
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
sha256sums_x86_64=('88b423153e097303d66606bd0851a2e000470e743f9ce5fa28bd9691f31948ec')
sha256sums_i686=('d1de3a8828103fe4556b6e18afa5bf92ce675c74cf1b65d6bac2b86113650fee')
sha256sums_aarch64=('4addd1cd8a114eadfbeec614b3459c0cec81a73159c228f461c2ba9b2af74bc1')

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
