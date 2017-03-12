# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to 'true' to build and install the plugins
_build_feedreader=true
_build_voip=true

# Set this to 'true' to enable auto login
#_autologin='true'

# set this to 'true' to use clang for compiling (experimental)
#_clang='true'

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.2
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libxss' 'libmicrohttpd' 'sqlcipher')
makedepends=('git' 'qt5-tools')

optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')

provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz")
sha256sums=('76a3ae2f2089b14562d5be34602f5ae3c73a8549aecee246ea5e67d03018de2b')

# Add missing dependencies if needed
[[ "$_build_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_build_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libgnome-keyring')

# Set options for qmake
_optClang=''
_optAutol=''
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'

build() {
	cd "${srcdir}/RetroShare-${pkgver}"

	# remove unwanted plugins
	[[ "$_build_voip" != 'true' ]] && sed -i '/VOIP \\/d' plugins/plugins.pro
	[[ "$_build_feedreader" != 'true' ]] && sed -i '/FeedReader/d' plugins/plugins.pro

	# call version scripts
	cd libretroshare/src
	LANG=C ./version_detail.sh
	cd ../..

	cd retroshare-gui/src
	LANG=C ./version_detail.sh
	cd ../..

	qmake   CONFIG-=debug CONFIG+=release \
		CONFIG+=rs_nodeprecatedwarning \
		${_optAutol} ${_optClang} \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
