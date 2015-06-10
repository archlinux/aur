# Maintainer: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to true to build and install retroshare-nogui
_build_nogui=true

# Set this to true to build and install the plugins
_build_linkscloud=true
_build_feedreader=true
_build_voip=true

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.5.5c
pkgrel=2
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('LGPL' 'GPL')
depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss')
install="${pkgname}.install"

source=(http://sourceforge.net/projects/retroshare/files/RetroShare/${pkgver}/retroshare_0.5.5-0.7068.tar.gz \
	${pkgname}.install \
	${pkgname}.desktop)

sha256sums=('772b0d7916137e81fc0f5ea14f0a8fa70d3d7acb701ca0b0c1c66018f2255650'
            '4b50547648612e9091536205402a4da9ddea9c18c0f71e5d6cd30b2226f206d9'
            '70be00968f2477e368f75393f193e76f366fff2dadab869c855e92048060cf29')

# Add missing dependencies if needed
[[ $_build_nogui == true ]] && depends=(${depends[@]} 'libssh' 'protobuf')
[[ $_build_voip == true ]] && depends=(${depends[@]} 'speex')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

_rssrcdir="retroshare-0.5.5/src"

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

	msg "Compiling libretroshare..."
	cd "${_srcdir}/libretroshare/src"
	$_qmake
	make

	msg "Compiling retroshare-gui..."
	cd "${_srcdir}/retroshare-gui/src"
	$_qmake
	make

	if [[ "$_build_voip" == "true" ]] ; then
		msg "Compiling VOIP plugin..."
		cd "${_srcdir}/plugins/VOIP"
		#sed -i 's/lessThan.*/true {/' VOIP.pro
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
		cd "${_srcdir}/rsctrl/src"
		make
		cd "${_srcdir}/retroshare-nogui/src"
		#sed -i 's/pkg-config --atleast-version 0.5.4 libssh/pkg-config --atleast-version 0.5 libssh/' retroshare-nogui.pro
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
		"${_srcdir}/retroshare-gui/src/gui/images/retrosharelogo2.png" \
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
