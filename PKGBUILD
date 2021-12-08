# Maintainer : djnk8 <djnk8@mailinator.com>

HNCCONTEXT=opt/hnc/hoffice11/Bin/qt/plugins/platforminputcontexts
NIMFLIB=libqt5im-nimf.so
KIMELIB=libkime-qt-5.11.3.so

_host='Host: cdn.hancom.com'
_referer='Referer: https://www.hancom.com/cs_center'
DLAGENTS=("https::/usr/bin/curl -# -o %o -H ${_referer// /\\ } -H ${_host// /\\} %u")

pkgname='hoffice'
pkgver=11.20.0.1520
pkgrel=4
pkgdesc='Office document editor for Linux. Hancom Office Editor is an application to allow you to edit office documents that is developed and distributed by Hancom Inc.'
arch=('x86_64')
source=(
	'https://cdn.hancom.com/pds/hnc/DOWN/gooroom/hoffice_11.20.0.1520_amd64.deb'
	'LICENSE'
	'libqt5im-nimf.so'
)

url='https://www.hancom.com/'

license=('custom:hoffice')

depends=('cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'harfbuzz' 'harfbuzz-icu' 'libcups' 'libcurl-gnutls' 'libxcb' 'qt5-base' 'qt5-x11extras' 'zlib')

sha256sums=(
	'1ecb2f82e915b49706d1f5f6d206f8bd4a9384fda2bd56798c94046865fe5730'
	'09b74399a45cde2b28e672784dbd1eb6397454a025e05a51fb3367eadb834583'
	'd246c02a20a1e4ea123f9c2275dfc4a2ea091a65032ddbbe8a59bfc71418f60c'
)

post_install() {
	xdg-icon-resource forceupdate --theme hicolor &>/dev/null
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

pre_remove() {
	if [[ -f "/${HNCCONTEXT}/${NIMFLIB}" ]]; then
		rm -vf "/${HNCCONTEXT}/${NIMFLIB}"
	fi
}

post_remove() {
	xdg-icon-resource forceupdate --theme hicolor &>/dev/null
	update-desktop-database -q
}

package() {

	curl -# -o "${srcdir}/${KIMELIB}" -fL 'https://github.com/Riey/kime/releases/latest/download/libkime-qt-5.11.3.so'

	msg2 "Extracting package binaries(data.tar.xz)..."

	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/hoffice" "${srcdir}/LICENSE"

	if [ -f "${srcdir}/${KIMELIB}" ] && [ -f "${srcdir}/${NIMFLIB}" ]; then
		install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${KIMELIB}"
		install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${NIMFLIB}"
	fi

	msg2 "The error messages are from UTF-8 limitations. Please ignore it, as it does no harm."
}
