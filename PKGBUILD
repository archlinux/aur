# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to 'true' to build and install the plugins
_build_feedreader=true
_build_voip=true

# set this to 'true' to use clang for compiling (experimental)
_clang=

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.1
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

#qt 5
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd' 'sqlcipher')
makedepends=('git' 'qt5-tools')

optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')

provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz")
sha256sums=('4ffbb6c61538f80d0f667c2a155c5eac38b0722a3e8d4f1dc1487d10087cfe42')

# Add missing dependencies if needed
[[ "$_build_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_build_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')

# Set options for qmake
_options=''
[[ "$_clang" == 'true' ]] && _options='-spec linux-clang CONFIG+=c++11'

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
		${_options} \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
