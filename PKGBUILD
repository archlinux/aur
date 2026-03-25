# Maintainer: Dhruva Sambrani <dhruvasambrani19 at gmail dot com>
# Ex-Maintainer: Bao <qubidt at gmail dot com>
# Ex-Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=9.0-beta.16+6140088b0
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
sha256sums_x86_64=('c28e0bde1437c5ab095f87b88af0c3d0c2cceb490aca746426367209e8530add')
sha256sums_i686=('a7d0e20dc54ca2427cd68afb76330583593986b069a415175f8216fc0986a62f')
sha256sums_aarch64=('6445d4dcee7e6b3c74f5ea068e06690b9a64952f2c29ea4318c6561562595e9f')

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
