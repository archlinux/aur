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

# Set this to 'true' to enable wiki functionality (experimental)
#_wiki='true'

# set this to 'true' to use clang for compiling (experimental)
#_clang='true'

# Unofficial plugins
#_plugin_lua4rs='true'

# Set this to 'true' to use use archlinux' rapidjson instead of shipped version
#_systems_rapidjson='true'

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.5
pkgrel=3
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://retroshare.cc/'
license=('GPL2')
depends=('qt5-multimedia' 'qt5-x11extras' 'miniupnpc' 'libxss' 'sqlcipher') # 'libmicrohttpd'
makedepends=('git' 'qt5-tools')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz"
        "bbaad838572b5fba6109bc7d3b5c55c2c68e6cdc.patch"
        "fix_icon_path.patch")
sha256sums=('901a1d1f282e04118fbe0e24190355b4a8f355a806cc5448738b1d691b46f5d5'
            'c8e53fb677f5438600a78e4bef4ee2aa6d837c1dfdff033545e087dd2d3e2280'
            '724f55edb3aa5ae34abfcba341cdecf3d6f5095d1d7018de4e254ae5627c426f')

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv3-opt')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_jsonapi" == 'true' ]] && depends=(${depends[@]} 'restbed')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libsecret')
[[ "$_systems_rapidjson" == 'true' ]] && makedepends=(${makedepends[@]} 'rapidjson')

# Set options for qmake
_optJsonapi=''
_optClang=''
_optAutol=''
_optPlugin=''
_optWiki=''
[[ "$_jsonapi" == 'true' ]] && _optJsonapi='CONFIG+=rs_jsonapi'
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'
([[ "$_plugin_voip" == 'true' ]] || [[ "$_plugin_feedreader" == 'true' ]] || [[ "$_plugin_lua4rs" == 'true' ]]) && _optPlugin='CONFIG+=retroshare_plugins'
[[ "$_wiki" == 'true' ]] && _optWiki='CONFIG+=wikipoos'

# Handle unofficial plugins
if [[ "$_plugin_lua4rs" == 'true' ]] ; then
	depends=(${depends[@]} 'lua')
    source=(${source[@]} 'Lua4RS::git+https://github.com/RetroShare/Lua4RS.git')
fi

prepare() {
	cd "${srcdir}/RetroShare-${pkgver}"

	patch -p1 --ignore-whitespace -i "${srcdir}"/bbaad838572b5fba6109bc7d3b5c55c2c68e6cdc.patch

	patch -p1 --ignore-whitespace -i "${srcdir}"/fix_icon_path.patch

	[[ "$_plugin_voip" == 'true' ]] && sed -i -e 's/PKGCONFIG += opencv/PKGCONFIG += opencv3/g' plugins/VOIP/VOIP.pro || true
}

build() {
	cd "${srcdir}/RetroShare-${pkgver}"

	# Handle unofficial plugins
	if [[ "$_plugin_lua4rs" == 'true' ]] ; then
		[[ -d 'plugins/Lua4RS' ]] &&  rm -r plugins//Lua4RS
		cp -r -l "${srcdir}/Lua4RS" plugins/
		sed -i -e 's/SUBDIRS += \\/SUBDIRS += \\\n\t\tLua4RS \\/g' plugins/plugins.pro
	fi

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
		RetroShare.pro
	# workaround
	make || make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
