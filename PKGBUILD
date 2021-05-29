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
license=('AGPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'miniupnpc' 'libxss' 'sqlcipher')
makedepends=('git' 'qt5-tools' 'rapidjson' 'cmake')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support'
            'i2pd: i2p hidden node support')
provides=("${pkgname}")
conflicts=("${pkgname}")

_restbed_cid='c27c6726d28c42e2e1b7537ba63eeb23e944789d'
_udpdiscoverycpp_cid='f3a3103a6c52e5707629e8d0a7e279a7758fe845'
_asio_cid='22afb86087a77037cd296d27134756c9b0d2cb75'
_catch_cid='d10b9bd02e098476670f5eb0527d2c7281476e8a'
_openssl_cid='894da2fb7ed5d314ee5c2fc9fd2d9b8b74111596'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/retroshare/${pkgname}/archive/v${pkgver}.tar.gz"
        "restbed-${_restbed_cid}.tar.gz::https://github.com/corvusoft/restbed/archive/${_restbed_cid}.tar.gz"
        "asio-${_asio_cid}.tar.gz::https://github.com/corvusoft/asio-dependency/archive/${_asio_cid}.tar.gz"
        "catch-${_catch_cid}.tar.gz::https://github.com/corvusoft/catch-dependency/archive/${_catch_cid}.tar.gz"
        "openssl-${_openssl_cid}.tar.gz::https://github.com/corvusoft/openssl-dependency/archive/${_openssl_cid}.tar.gz"
        "udp-discovery-cpp-${_udpdiscoverycpp_cid}.tar.gz::https://github.com/truvorskameikin/udp-discovery-cpp/archive/${_udpdiscoverycpp_cid}.tar.gz"
        "fix_icon_path.patch"
        "fix_create_directories.patch")

sha256sums=('c545b9249ac7dbfef72a2d636bc0f8b729c7ce05f21a54dd9284b2a387592d4a'
            'e01389d3f0481458e14861ee33abc2f7aec3a382bd70e91dee495ac6e943d403'
            'a4a47becc545c88724fa831617e628c66503d5ef7faf235c7c7237611230f59f'
            'df455d92de685af7798c2e18811a5e86f95777e8c022ab9b13f3b2b3d134a16d'
            'd5e94ef0fd5aa9168080cc3c086093443964b582292c91519d391db8ac4065b4'
            'ec00c4da0d43769351ff94cef81b30afe0dd1932a80ded497a338b2f2364d232'
            '724f55edb3aa5ae34abfcba341cdecf3d6f5095d1d7018de4e254ae5627c426f'
            '1019d25aa0f6d467fcd1e67c15acb5e11a44f97b328385b750b061decdcdf6a3')

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv3-opt')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_jsonapi" == 'true' ]] && makedepends=(${makedepends[@]} 'doxygen')
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

prepare() {
	mv "${srcdir}"/{RetroShare,${pkgname}}-${pkgver}
	cd "${srcdir}"/${pkgname}-${pkgver}

	patch -p1 --ignore-whitespace -i "${srcdir}"/fix_icon_path.patch
        patch -p1 --ignore-whitespace -i "${srcdir}"/fix_create_directories.patch

	[[ "$_plugin_voip" == 'true' ]] && sed -i -e 's/PKGCONFIG += opencv/PKGCONFIG += opencv3/g' plugins/VOIP/VOIP.pro || true

	# manually clone dependencies (if anybody knows a better way to do this, let me know!)
	cd supportlibs
	rm -rf restbed
	rm -rf udp-discovery-cpp
	rm -rf "${srcdir}"/restbed-${_restbed_cid}/dependency/*
	mv "${srcdir}"/restbed-${_restbed_cid}                   restbed
	mv "${srcdir}"/asio-dependency-${_asio_cid}              restbed/dependency/asio
	mv "${srcdir}"/catch-dependency-${_catch_cid}            restbed/dependency/catch
	mv "${srcdir}"/openssl-dependency-${_openssl_cid}        restbed/dependency/kashmir
	mv "${srcdir}"/udp-discovery-cpp-${_udpdiscoverycpp_cid} udp-discovery-cpp
}

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

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
	cd "${srcdir}"/${pkgname}-${pkgver}

	make INSTALL_ROOT="${pkgdir}" install
}
