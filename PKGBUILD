# Maintainer: Matt Parnell/ilikenwf
# Cleanup: Sam Stuewe <halosghost@archlinux.info>
# still want to build trunk? use http://sprunge.us/XARP instead
_gitname="nightingale-hacking"
_branch="gstreamer-1.0"
pkgname="nightingale-git"
pkgver=8d024f1
pkgrel=1
pkgdesc="Community port of Songbird to be more Linux native, up to date, and open."
arch=('i686' 'x86_64')
url="http://getnightingale.com/"
license=('GPL2' 'MPL' 'BSD')
makedepends=('git' 'subversion' 'python' 'unzip' 'libidl2' 'zip' 'glib2')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer' 'gtk2' 'libxt' 'sqlite3' 'taglib')
conflicts=('nightingale')
provides=('nightingale')
install="nightingale.install"
source=("nightingale::git://github.com/nightingale-media-player/${_gitname}.git#branch=${_branch}"
        "Nightingale.desktop"
        "http://downloads.sourceforge.net/project/ngale/1.12-Build-Deps/linux-${CARCH}-1.12-20130316-release-final.tar.lzma")
md5sums=('SKIP'
         '7741cc247648e95dd9dad8c953616757')
[[ "${CARCH}" == 'i686' ]] && md5sums+=('c30cc1d763d8c5cc0b0a2ae8216af18b')
[[ "${CARCH}" == 'x86_64' ]] && md5sums+=('a9b47ef0b21106f6b51231046e1758d1')

pkgver() {
	cd "nightingale"
	git describe --always | sed 's|-|.|g'
}

prepare() {
   cd "${srcdir}/nightingale/dependencies"
   ln -sf "${srcdir}/linux-$CARCH" ./

   export GST_PLUGIN_PATH="/usr/lib/gstreamer-1.0"
   echo 'ac_add_options --with-media-core=gstreamer-system' >> "${srcdir}/nightingale/nightingale.config"
   echo 'ac_add_options --with-gstreamer-1.0\n' >> "${srcdir}/nightingale/nightingale.config"
}

build() {	
	cd "${srcdir}/nightingale"
	
	make
	
	# copy the add-ons first
	[ -d ../xpi-stage ] && rm -rf ../xpi-stage 
	cp -a "${srcdir}/nightingale/compiled/xpi-stage" "${srcdir}"
}

package() {
	install -d --group=users "${pkgdir}/opt/nightingale"
	cd "nightingale/compiled/dist"
	sed -i 's/0\.10/1\.0/g' nightingale # hack for now to make the launcher work properly
	cp -a --no-preserve=ownership * ${pkgdir}/opt/nightingale/

	chmod 755 "${pkgdir}/opt/nightingale/nightingale-bin"
	chmod 755 "${pkgdir}/opt/nightingale/xulrunner/xulrunner-bin"
	chmod -R a+r "${pkgdir}/opt/nightingale"
	
	install -D "${srcdir}/nightingale/compiled/dist/chrome/icons/default/default.xpm" \
		"${pkgdir}/usr/share/pixmaps/nightingale.xpm"
	install -Dm644 "${srcdir}/Nightingale.desktop" \
		"${pkgdir}/usr/share/applications/Nightingale.desktop"

	find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
