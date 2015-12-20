# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='mbmp-git'
pkgname=('mbmp')
pkgver=2015.11.25.r188
pkgrel=1
pkgdesc='Media Player based on Qt and Gstreamer'
arch=('i686' 'x86_64')
url='https://github.com/andrew-bibb/mbmp.git'
license=('GPL2')
groups=()
install=('pkg.install')
makedepends=('make' 'sed')
source=("${pkgbase//-git/}::git://github.com/andrew-bibb/mbmp.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase//-git/}"
	_ver=$(git describe --abbrev=0 --tags|sed 's/mbmp-//')
	_rev=$(git rev-list --count HEAD)
	printf "$_ver.r$_rev"
}

prepare() {
	cd "${pkgbase//-git/}"
###fix categories
	sed -i 's/,/;/g' misc/desktop/mbmp.desktop
}

build() {
	cd "${pkgbase//-git/}"
	/usr/lib/qt/bin/qmake
	make
}

package_mbmp() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<=${pkgver}")
	pkgdesc='Media Player based on Qt and Gstreamer'
	optdepends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
	'gst-plugins-ugly' 'gst-libav' 'gst-vaapi')
	depends=("qt5-base" "gstreamer" 'desktop-file-utils' 'glib2')
	install -Dm0755 "${pkgbase//-git/}"/mbmp "${pkgdir}"/usr/bin/mbmp 
	install -Dm0644 "${pkgbase//-git/}"/misc/desktop/mbmp.desktop "${pkgdir}"/usr/share/applications/mbmp.desktop
	cd "${pkgbase//-git/}"/misc/manpage
	gzip mbmp.1
	install -Dm0644 mbmp.1.gz "${pkgdir}"/usr/share/man/man1/mbmp.1.gz
}
