# Maintainer: stqn

# Set this to true to build and install retroshare-nogui
_build_nogui=true

# Set this to true to build and install the plugins
_build_linkscloud=true
_build_feedreader=true
_build_voip=true

### Nothing to be changed below this line ###

_branch="branches/v0.5.5"
#_svnmod=trunk
_svnmod=v0.5.5

pkgname=retroshare-svn
pkgver=7261
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss')
makedepends=('subversion')
provides=('retroshare')
conflicts=('retroshare')
install='retroshare.install'
source=('svn://svn.code.sf.net/p/retroshare/code/'$_branch
		'retroshare.install')
sha256sums=('SKIP'
			'47c23238cbfabb6f07b6a25666ee5941243176360ca28ec31378d94e87326ec1')

# Add missing dependencies if needed
[[ $_build_nogui == true ]] && depends=(${depends[@]} 'libssh' 'protobuf')
[[ $_build_voip == true ]] && depends=(${depends[@]} 'speex')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

pkgver() {
	LANG=C svn info "$SRCDEST/$_svnmod" | awk '/Last Changed Rev/ {print $4}'
}

prepare() {
	# Since makepkg 4.1.0 uses svn export, version_detail.sh doesn’t work
	# unless we copy the needed .svn directory first
	cp -a "$SRCDEST/$_svnmod/.svn" "$srcdir/$_svnmod/"
}

build() {
	cd "$srcdir/$_svnmod"

	_qmake='qmake-qt4'

	#
	# BUILD HERE
	#
	msg "Compiling OpenPGP-SDK..."
	cd openpgpsdk/src
	$_qmake
	make
	cd ../..

	msg "Compiling libbitdht..."
	cd libbitdht/src
	$_qmake
	make
	cd ../..

	msg "Compiling libretroshare..."
	cd libretroshare/src
	$_qmake
	LANG=C ./version_detail.sh
	make
	cd ../..

	msg "Compiling retroshare-gui..."
	cd retroshare-gui/src
	$_qmake
	LANG=C ./version_detail.sh
	make
	cd ../..

	if [[ "$_build_voip" == "true" ]] ; then
		msg "Compiling VOIP plugin..."
		cd "plugins/VOIP"
		$_qmake
		make
		cd ../..
	fi

	if [[ "$_build_feedreader" == "true" ]] ; then
		msg "Compiling FeedReader plugin..."
		cd "plugins/FeedReader"
		$_qmake
		make
		cd ../..
	fi

	if [[ "$_build_linkscloud" == "true" ]] ; then
		msg "Compiling LinksCloud plugin..."
		cd "plugins/LinksCloud"
		$_qmake
		make
		cd ../..
	fi

	if [[ "$_build_nogui" == "true" ]]; then
		msg "Compiling retroshare-nogui..."
		cd rsctrl/src
		make
		cd ../../retroshare-nogui/src
		$_qmake
		make
	fi
}

package() {
	cd "$srcdir/$_svnmod"

	# Binaries
	install -D -m 755 retroshare-gui/src/RetroShare "$pkgdir/usr/bin/retroshare"
	if [[ "$_build_nogui" == "true" ]]; then
		install -D -m 755 \
			"retroshare-nogui/src/retroshare-nogui" \
			"${pkgdir}/usr/bin/retroshare-nogui"
	fi

	# Plugins
	if [[ "$_build_linkscloud" == "true" ]] ; then
		install -D -m 755 \
			"plugins/LinksCloud/libLinksCloud.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libLinksCloud.so"
	fi
	if [[ "$_build_voip" == "true" ]] ; then
		install -D -m 755 \
			"plugins/VOIP/libVOIP.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libVOIP.so"
	fi
	if [[ "$_build_feedreader" == "true" ]] ; then
		install -D -m 755 \
			"plugins/FeedReader/libFeedReader.so" \
			"${pkgdir}/usr/lib/retroshare/extensions/libFeedReader.so"
	fi

	# Applications menu entry
	mkdir -p "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/retroshare.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=RetroShare
GenericName=Sharing Network
Comment=Secure communication with your friends
Icon=/usr/share/pixmaps/retroshare_blue.png
Exec=/usr/bin/retroshare
Terminal=false
StartupNotify=true
Categories=Network;InstantMessaging;FileTransfer;Chat;Email;
EOF
	install -D -m 644 \
		"retroshare-gui/src/gui/images/retrosharelogo1.png" \
		"${pkgdir}/usr/share/pixmaps/retroshare_blue.png"

	# bdboot (needed to bootstrap the DHT)
	install -D -m 644 \
		"libbitdht/src/bitdht/bdboot.txt" \
		"${pkgdir}/usr/share/RetroShare/bdboot.txt"

	# Skins
	cp -r "retroshare-gui/src/qss" "${pkgdir}/usr/share/RetroShare/"
}
