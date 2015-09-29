# Maintainer: Matt Parnell/ilikenwf
# Cleanup: Sam Stuewe <halosghost@archlinux.info>
# still want to build trunk? use http://sprunge.us/XARP instead
pkgname="nightingale-git"
pkgver=1e74b6f
pkgrel=1
pkgdesc="No binaries used. Open source fork of the Songbird Media Player with updates and fixes."
arch=('i686' 'x86_64')
url="http://getnightingale.com/"
license=('GPL2' 'MPL' 'BSD')
makedepends=('git' 'subversion' 'python' 'unzip' 'libidl2' 'zip' 'glib2')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer' 'gtk2' 'libxt' 'sqlite3' 'taglib')
conflicts=('nightingale')
provides=('nightingale')
install="nightingale.install"
source=("nightingale-hacking::git://github.com/nightingale-media-player/nightingale-hacking.git#branch=gstreamer-1.0"
		"nightingale-deps::git://github.com/nightingale-media-player/nightingale-deps.git#branch=xul-192-new"
        "Nightingale.desktop")
md5sums=('SKIP'
		 'SKIP'
         '7741cc247648e95dd9dad8c953616757')

pkgver() {
	cd "nightingale"
	git describe --always | sed 's|-|.|g'
}

prepare() {
   export GST_PLUGIN_PATH="/usr/lib/gstreamer-1.0"
   echo 'ac_add_options --with-media-core=gstreamer-system' > "${srcdir}/nightingale-hacking/nightingale.config"
   echo 'ac_add_options --with-gstreamer-1.0' >> "${srcdir}/nightingale-hacking/nightingale.config"
   echo 'ac_add_options --with-taglib-source=system' >> "${srcdir}/nightingale-hacking/nightingale.config"
}

build() {
	
	if [ ! -d "${srcdir}/linux-${CARCH}" ]; then
		msg "Building static dependencies xulrunner and sqlite..."
		
		mkdir "${srcdir}/linux-${CARCH}"
		cd "${srcdir}/nightingale-deps"
		
		# xul 1.9.2 won't build without this
		unset CPPFLAGS
		
		export SB_VENDOR_BINARIES_CO_ROOT=${srcdir}
		export SB_VENDOR_BUILD_ROOT=${srcdir}
		export CXXFLAGS="$CXXFLAGS -fpermissive"

		# fix mozilla freetype headers
		sed -i 's/freetype\///g' xulrunner-1.9.2/mozilla/config/system-headers
		sed -i 's/freetype\///g' xulrunner-1.9.2/mozilla/gfx/thebes/src/gfxPangoFonts.cpp
		
		msg2 "Building xulrunner 1.9.2...\n"
		make -C xulrunner-1.9.2 -f Makefile.songbird xr-clean xr-build-release xr-packaging-release

		msg2 "Building sqlite...\n"
		make -C sqlite -f Makefile.songbird
	else
		msg "Using existing dependencies. If you haven't rebuilt in a while please rm -rf pkg and src and start over."
	fi
	
	if [ ! -d "${srcdir}/nightingale-hacking/dependencies/linux-${CARCH}" ]; then
		# link our hopefully fresh compiled deps (no more bins!)
		ln -s "${srcdir}/linux-${CARCH}" "${srcdir}/nightingale-hacking/dependencies/linux-${CARCH}"
	fi
	
	cd "${srcdir}/nightingale-hacking"
	
	make
	
	# copy the add-ons first
	[ -d ../xpi-stage ] && rm -rf ../xpi-stage 
	cp -a "${srcdir}/nightingale-hacking/compiled/xpi-stage" "${srcdir}"
}

package() {
	install -d --group=users "${pkgdir}/opt/nightingale"
	cd "nightingale/compiled/dist"
	sed -i 's/0\.10/1\.0/g' nightingale # hack for now to make the launcher work properly
	cp -a --no-preserve=ownership * ${pkgdir}/opt/nightingale/

	chmod 755 "${pkgdir}/opt/nightingale/nightingale-bin"
	chmod 755 "${pkgdir}/opt/nightingale/xulrunner/xulrunner-bin"
	chmod -R a+r "${pkgdir}/opt/nightingale"
	
	install -D "${srcdir}/nightingale-hacking/compiled/dist/chrome/icons/default/default.xpm" \
		"${pkgdir}/usr/share/pixmaps/nightingale.xpm"
	install -Dm644 "${srcdir}/nightingale-hacking.desktop" \
		"${pkgdir}/usr/share/applications/Nightingale.desktop"

	find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
	
	msg "You will find addon files generated in ${srcdir}/xpi-stage."
}
