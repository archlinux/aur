# Maintainer: sehraf
# Contributor: stqn

# Set this to 'true' to build and install the plugins
#_plugin_feedreader='true'
#_plugin_voip='true'

# Set this to 'true' to enable the new automatically generated jsaon api
# _jsonapi='true'

# Set this to 'true' to enable auto login
#_autologin='true'

# Set this to 'false' to disable nativ (system) dialogs
_nativ_dialogs='true'

# Set this to 'true' to enable wiki functionality (experimental)
#_wiki='true'

# Set this to 'true' to use clang for compiling (experimental)
#_clang='true'

# INCOMPATIBLE OPTION - Do not swtich between different version with this enabled and disbaled! RetroShare required _manual_ migration!
# Set this to 'true' to not used an encrypted database. This will likely enhance your performance.
#_no_sqlcipher='true'

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git
pkgver=v0.6.6.r573.g1474dfdd6
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://retroshare.cc/'
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'miniupnpc' 'libxss' 'libmicrohttpd' 'xapian-core')
makedepends=('git' 'qt5-tools' 'rapidjson' 'cmake')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support'
            'i2pd: i2p hidden node support' )
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
	"${_pkgname}::git+https://github.com/RetroShare/RetroShare.git"
	'libbitdht::git+https://github.com/RetroShare/BitDHT.git'
	'libretroshare::git+https://github.com/RetroShare/libretroshare.git'
	'openpgpsdk::git+https://github.com/RetroShare/OpenPGP-SDK.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# Add sql dependency
[[ "$_no_sqlcipher" == 'true' ]] && depends=(${depends[@]} 'sqlite') || depends=(${depends[@]} 'sqlcipher')
_optSql=''
[[ "$_no_sqlcipher" == 'true' ]] && _optSql='CONFIG+=no_sqlcipher'

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_jsonapi" == 'true' ]] && makedepends=(${makedepends[@]} 'cmake' 'doxygen')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libsecret')

# Set options for qmake
_optJsonapi=''
_optClang=''
_optAutol=''
_optPlugin=''
_optWiki=''
_optNativDialogs=''
[[ "$_jsonapi" == 'true' ]] && _optJsonapi='CONFIG+=rs_jsonapi'
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'
[[ "$_nativ_dialogs" == 'true' ]] && _optNativDialogs='CONFIG*=rs_use_native_dialogs'
([[ "$_plugin_voip" == 'true' ]] || [[ "$_plugin_feedreader" == 'true' ]]) && _optPlugin='CONFIG+=retroshare_plugins'
[[ "$_wiki" == 'true' ]] && _optWiki='CONFIG+=wikipoos'

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	git submodule init
	git config submodule.libbitdht.url "$srcdir/libbitdht"
	git config submodule.libretroshare.url "$srcdir/libretroshare"
	git config submodule.openpgpsdk.url "$srcdir/openpgpsdk"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}/${_pkgname}"

	# remove unwanted plugins
	[[ "$_plugin_voip" != 'true' ]] && sed -i '/VOIP \\/d' plugins/plugins.pro
	[[ "$_plugin_feedreader" != 'true' ]] && sed -i '/FeedReader/d' plugins/plugins.pro

#	rmdir supportlibs/restbed/include || true
#	rmdir /tmp/makepkg/retroshare-git/src/retroshare/supportlibs/cmark/build/src && /tmp/makepkg/retroshare-git/src/retroshare/supportlibs/cmark/build || true

	qmake   CONFIG-=debug CONFIG+=release 'RS_UPNP_LIB=miniupnpc'\
		${_optSql} \
		${_optJsonapi} ${_optAutol} ${_optClang} \
		${_optNativDialogs} \
		${_optPlugin} ${_optWiki} \
		CONFIG+=no_rs_friendserver \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
		RetroShare.pro

	make || true
	rmdir supportlibs/restbed/include || true
#	make || make
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
