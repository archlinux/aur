# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to 'true' to build and install the plugins
#_plugin_feedreader='true'
#_plugin_voip='true' # currently broken!!!

# Set this to 'true' to enable the new automatically generated jsaon api
#_jsonapi='true'

# Set this to 'true' to enable auto login
#_autologin='true'

# Set this to 'false' to disable nativ (system) dialogs
_nativ_dialogs='true'

# Set this to 'true' to enable wiki functionality (experimental)
#_wiki='true'

# set this to 'true' to use clang for compiling (experimental)
#_clang='true'

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.6
pkgrel=2
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://retroshare.cc/'
license=('GPL2')
depends=('qt5-multimedia' 'qt5-x11extras' 'miniupnpc' 'libxss' 'sqlcipher') # 'libmicrohttpd'
makedepends=('git' 'qt5-tools' 'rapidjson')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support'
            'i2pd: i2p hidden node support' )
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz"
        "fix_icon_path.patch")
sha256sums=('c545b9249ac7dbfef72a2d636bc0f8b729c7ce05f21a54dd9284b2a387592d4a'
            '724f55edb3aa5ae34abfcba341cdecf3d6f5095d1d7018de4e254ae5627c426f')

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv3-opt')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libsecret')

# Set options for qmake
_optJsonapi=''
_optClang=''
_optAutol=''
_optPlugin=''
_optWiki=''
[[ "$_jsonapi" == 'true' ]] && _optJsonapi='CONFIG+=rs_jsonapi'
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'
[[ "$_nativ_dialogs" == 'true' ]] && _optNativDialogs='CONFIG*=rs_use_native_dialogs'
([[ "$_plugin_voip" == 'true' ]] || [[ "$_plugin_feedreader" == 'true' ]]) && _optPlugin='CONFIG+=retroshare_plugins'
[[ "$_wiki" == 'true' ]] && _optWiki='CONFIG+=wikipoos'

get_git_repo() {
	git clone -n https://github.com/$1/$2
	cd $2
	git checkout $3
	cd ..
}

prepare() {
	cd "${srcdir}/RetroShare-${pkgver}"

	patch -p1 --ignore-whitespace -i "${srcdir}"/fix_icon_path.patch

	[[ "$_plugin_voip" == 'true' ]] && sed -i -e 's/PKGCONFIG += opencv/PKGCONFIG += opencv3/g' plugins/VOIP/VOIP.pro || true

	# manually clone dependencies (if anybody knows a better way to do this, let me know!)
	cd supportlibs
		rmdir restbed/dependency/asio || true
		rmdir restbed/dependency/catch || true
		rmdir restbed/dependency/kashmir || true
		rmdir -p restbed/dependency || true
		rmdir restbed || true
		get_git_repo 'Corvusoft' 'restbed' 'c27c6726d28c42e2e1b7537ba63eeb23e944789d'

		# get restbed deps
		cd restbed
			git submodule update --init dependency/asio
			git submodule update --init dependency/catch
			git submodule update --init dependency/kashmir
		cd ..

		rmdir udp-discovery-cpp || true
		get_git_repo 'truvorskameikin' 'udp-discovery-cpp' 'f3a3103a6c52e5707629e8d0a7e279a7758fe845'

	cd ..
}

build() {
	cd "${srcdir}/RetroShare-${pkgver}"

	# remove unwanted plugins
	[[ "$_plugin_voip" != 'true' ]] && sed -i '/VOIP \\/d' plugins/plugins.pro
	[[ "$_plugin_feedreader" != 'true' ]] && sed -i '/FeedReader/d' plugins/plugins.pro

	qmake   CONFIG-=debug CONFIG+=release \
		${_optJsonapi} ${_optAutol} ${_optClang} \
		${_optPlugin} ${_optWiki} \
		CONFIG+=no_libresapihttpserver \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
		'RS_UPNP_LIB="miniupnpc"' \
		'RS_MAJOR_VERSION=0' \
		'RS_MINOR_VERSION=6' \
		'RS_MINI_VERSION=6' \
		'RS_EXTRA_VERSION=""' \
		RetroShare.pro

	make || true
	rmdir supportlibs/restbed/include || true
	make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
