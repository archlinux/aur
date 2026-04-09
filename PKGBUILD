# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
# Ex-Maintainer: Bao <qubidt at gmail dot com>
# Ex-Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=9.0-beta.21+1a89239a1
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
sha256sums_x86_64=('7a654458f196cbf8dee19940f689366efa2450898a370219c284b410c88ead2f')
sha256sums_i686=('ca117e50b6199b6de61682184da44aa5ae62666aa1de5b65bd641d1b910a6cb2')
sha256sums_aarch64=('27cd7948ab9e66d4211a989cb57bb7063f6bdcf7ce31316528708f4c54985e63')

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
