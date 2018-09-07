# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to 'true' to build and install the plugins
#_plugin_feedreader=true
#_plugin_voip=true

# Set this to 'true' to enable auto login
#_autologin='true'

# set this to 'true' to use clang for compiling (experimental)
#_clang='true'

# Unofficial plugins
#_plugin_lua4rs='true'

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.4
pkgrel=2
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libxss' 'libmicrohttpd' 'sqlcipher')
makedepends=('git' 'qt5-tools')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz"
	"https://github.com/RetroShare/RetroShare/commit/4d287d68bc9725f403dc7d952a927d401c5d6c97.patch")
sha256sums=('84355c0f3be5ec1dfa7253e327ea1254f76f47739c233cfb8d0983ebd1a61f4a'
            'd5b775333a351068711dc12bb50d92fde4966fcaaf393039c324b46e2f03f986')

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libgnome-keyring')

# Set options for qmake
_optClang=''
_optAutol=''
_optPlugin=''
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'
([[ "$_plugin_voip" == 'true' ]] || [[ "$_plugin_feedreader" == 'true' ]] || [[ "$_plugin_lua4rs" == 'true' ]]) && _optPlugin='CONFIG+=retroshare_plugins'

# Handle unofficial plugins
if [[ "$_plugin_lua4rs" == 'true' ]] ; then
	depends=(${depends[@]} 'lua')
        source=(${source[@]} 'Lua4RS::git+https://github.com/RetroShare/Lua4RS.git')
fi

prepare() {
	cd "${srcdir}/RetroShare-${pkgver}"
	git apply ../4d287d68bc9725f403dc7d952a927d401c5d6c97.patch
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

	# call version scripts
	cd libretroshare/src
	LANG=C ./version_detail.sh
	cd ../..

	cd retroshare-gui/src
	LANG=C ./version_detail.sh
	cd ../..

	qmake   CONFIG-=debug CONFIG+=release \
		${_optAutol} ${_optClang} ${_optPlugin} \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
