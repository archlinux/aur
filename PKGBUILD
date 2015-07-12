# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to true to build and install retroshare-nogui
_build_nogui=true

# Set this to true to build and install the plugins
_build_feedreader=true
_build_voip=false

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.0.RC2
pkgrel=3
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd' 'sqlcipher')
provides=('retroshare')
conflicts=('retroshare')

install="${pkgname}.install"

source=(#http://sourceforge.net/projects/retroshare/files/RetroShare/${pkgver}/retroshare_0.6.0.RC2~8551.tar.gz \
		http://downloads.sourceforge.net/project/retroshare/RetroShare/0.6.0-rc2/retroshare_0.6.0.RC2~8551_src.tgz \
		${pkgname}.install \
		${pkgname}.desktop)

sha256sums=('2320676da905de6c48b01eda611811965277ffa1d5ddbb387aa8f0414c2de050'
            '4b50547648612e9091536205402a4da9ddea9c18c0f71e5d6cd30b2226f206d9'
            '70be00968f2477e368f75393f193e76f366fff2dadab869c855e92048060cf29')

# Add missing dependencies if needed
[[ $_build_voip == true ]] && depends=(${depends[@]} 'speex' 'openvc')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

_rssrcdir="retroshare06-0.6.0/src"

build() {
	local _srcdir="${srcdir}/$_rssrcdir"
	local _qmake='qmake-qt4'

	msg "Compiling OpenPGP-SDK..."
	cd "${_srcdir}/openpgpsdk/src"
	$_qmake
	make

	msg "Compiling libbitdht..."
	cd "${_srcdir}/libbitdht/src"
	$_qmake
	make

	msg "Compiling pegmarkdown..."
	cd "${_srcdir}/supportlibs/pegmarkdown"
	$_qmake
	make


	msg "Compiling libretroshare..."
	cd "${_srcdir}/libretroshare/src"
	$_qmake
	make

	msg "Compiling libresapi..."
	cd "${_srcdir}/libresapi/src"
	$_qmake
	make

	# i'm not 100% sure if this step is required
	# it will download/update some JavaScript files
	msg "Updating webui files..."
	cd "${_srcdir}/libresapi/src/webui/"
	make

	msg "Compiling retroshare-gui..."
	cd "${_srcdir}/retroshare-gui/src"
	$_qmake
	make

	if [[ "$_build_voip" == "true" ]] ; then
		msg "Compiling VOIP plugin..."
		cd "${_srcdir}/plugins/VOIP"
		$_qmake
		make
	fi

	if [[ "$_build_feedreader" == "true" ]] ; then
		msg "Compiling FeedReader plugin..."
		cd "${_srcdir}/plugins/FeedReader"
		$_qmake
		make
	fi

	if [[ "$_build_linkscloud" == "true" ]] ; then
		msg "Compiling LinksCloud plugin..."
		cd "${_srcdir}/plugins/LinksCloud"
		$_qmake
		make
	fi

	if [[ $_build_nogui == "true" ]] ; then
		msg "Compiling retroshare-nogui..."
		cd "${_srcdir}/retroshare-nogui/src"
		$_qmake
		make
	fi
}

package() {
	local _srcdir="${srcdir}/$_rssrcdir"

	# --- Install Files ---

	msg "Installing files to fakeroot-environment..."

	install -D -m 755 \
		"${_srcdir}/retroshare-gui/src/RetroShare" \
		"${pkgdir}/usr/bin/${pkgname}"

	if [[ "$_build_nogui" == "true" ]] ; then
		install -D -m 755 \
			"${_srcdir}/retroshare-nogui/src/retroshare-nogui" \
			"${pkgdir}/usr/bin/${pkgname}-nogui"
	fi

    # Webui files ( the path is currently hardcoded for the gui )
	install -d -m 655 "${pkgdir}/usr/share/RetroShare06/webui/"
	for _file in $(ls "${_srcdir}/libresapi/src/webfiles/"); do
		install -D -m 644 \
			"${_srcdir}/libresapi/src/webfiles/${_file}" \
			"${pkgdir}/usr/share/RetroShare06/webui/"
	done


	# Plugins
	if [[ "$_build_linkscloud" == "true" ]] ; then
		install -D -m 755 \
			"${_srcdir}/plugins/LinksCloud/libLinksCloud.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libLinksCloud.so"
	fi
	if [[ "$_build_voip" == "true" ]] ; then
		install -D -m 755 \
			"${_srcdir}/plugins/VOIP/libVOIP.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libVOIP.so"
	fi
	if [[ "$_build_feedreader" == "true" ]] ; then
		install -D -m 755 \
			"${_srcdir}/plugins/FeedReader/libFeedReader.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libFeedReader.so"
	fi

	# Icons
	install -D -m 644 \
		"${_srcdir}/retroshare-gui/src/gui/images/logo/logo_512.png" \
		"${pkgdir}/usr/share/pixmaps/retroshare.png"

	# Desktop File
	install -D -m 644 \
		"${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# bdboot (needed to bootstrap the DHT)
	install -D -m 644 \
		"${_srcdir}/libbitdht/src/bitdht/bdboot.txt" \
		"${pkgdir}/usr/share/RetroShare/bdboot.txt"

	# Skins
	cp -r "${_srcdir}/retroshare-gui/src/qss" "${pkgdir}/usr/share/RetroShare/"
	#find "${pkgdir}/usr/share/RetroShare/" -depth -type d -name ".svn" -exec rm -r {} \;
}
