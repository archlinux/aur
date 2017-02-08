# Maintainer: sehraf
# Contributor: stqn
# custom : fanch

# Set this to 'true' to build and install the plugins
_build_feedreader=false
_build_voip=false

# set this to 'true' to use clang for compiling (experimental)
_clang=

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git-no-sqlcipher
pkgver=0.6.1.r610.gc61ccda43
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd')
makedepends=('git' 'qt5-tools')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/RetroShare/RetroShare.git")
sha256sums=('SKIP')

# Add missing dependencies if needed
[[ "$_build_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_build_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')

# Set options for qmake
_options='CONFIG+=no_sqlcipher'
[[ "$_clang" == 'true' ]] && _options='-spec linux-clang CONFIG+=c++11'

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

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
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
