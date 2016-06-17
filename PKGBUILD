# Maintainer: Matt Parnell/ilikenwf
# Cleanup: Sam Stuewe <halosghost@archlinux.info>
# still want to build trunk? use http://sprunge.us/XARP instead
pkgname="nightingale-git"
pkgver=78bd501
pkgrel=1
pkgdesc="Open source fork of the Songbird Media Player. Uses prebuilt xulrunner and sqlite."
arch=('i686' 'x86_64')
url="http://getnightingale.com/"
license=('GPL2' 'MPL' 'BSD')
makedepends=('git' 'subversion' 'python' 'unzip' 'libidl2' 'zip' 'glib2' 'pkg-config' 'diffutils' 'libgnomeui' 'python2' 'autoconf2.13' 'gcc5')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer' 'gtk2' 'libxt' 'sqlite3' 'taglib'
'gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent' 'libnotify>=0.4'
)
conflicts=('nightingale')
provides=('nightingale')
install="nightingale.install"
source=("nightingale-hacking::git://github.com/nightingale-media-player/nightingale-hacking.git#branch=gstreamer-1.0"
		"https://bitbucket.org/nightingale-media-player/nightingale-deps/downloads/linux-${CARCH}-1.12-20130316-release-final.tar.lzma"
        "Nightingale.desktop")
md5sums=('SKIP'
         'a9b47ef0b21106f6b51231046e1758d1'
         '7741cc247648e95dd9dad8c953616757')

pkgver() {
	cd "nightingale-hacking"
	git describe --always | sed 's|-|.|g'
}

prepare() {
   export GST_PLUGIN_PATH="/usr/lib/gstreamer-1.0"
   echo 'ac_add_options --with-media-core=gstreamer-system' > "${srcdir}/nightingale-hacking/nightingale.config"
   echo 'ac_add_options --with-gstreamer-1.0' >> "${srcdir}/nightingale-hacking/nightingale.config"
   echo 'ac_add_options --with-taglib-source=system' >> "${srcdir}/nightingale-hacking/nightingale.config"
   echo 'ac_add_options --enable-official' >> "${srcdir}/nightingale-hacking/nightingale.config"
   
   cd "${srcdir}/nightingale-hacking/dependencies"
   ln -sf "${srcdir}/linux-${CARCH}" ./
}

build() {	
	cd "${srcdir}/nightingale-hacking"
	
	export CC=gcc-5
	export CXX=g++-5
		
	make
	
	# copy the add-ons first
	[ -d ../xpi-stage ] && rm -rf ../xpi-stage 
	cp -a "${srcdir}/nightingale-hacking/compiled/xpi-stage" "${srcdir}"
}

package() {
	install -d --group=users "${pkgdir}/opt/nightingale"
	cd "nightingale-hacking/compiled/dist"
	sed -i 's/0\.10/1\.0/g' nightingale # hack for now to make the launcher work properly
	cp -a --no-preserve=ownership * ${pkgdir}/opt/nightingale/

	chmod 755 "${pkgdir}/opt/nightingale/nightingale-bin"
	chmod 755 "${pkgdir}/opt/nightingale/xulrunner/xulrunner-bin"
	chmod -R a+r "${pkgdir}/opt/nightingale"
	
	install -D "${srcdir}/nightingale-hacking/compiled/dist/chrome/icons/default/default.xpm" \
		"${pkgdir}/usr/share/pixmaps/nightingale.xpm"
	install -Dm644 "${srcdir}/Nightingale.desktop" \
		"${pkgdir}/usr/share/applications/Nightingale.desktop"

	find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
	
	msg "You will find addon files generated in ${srcdir}/xpi-stage."
}
