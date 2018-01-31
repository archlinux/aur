# Maintainer: sehraf
# Contributor: stqn
# custom : fanch

# Set this to 'true' to build and install the plugins
_build_feedreader=true
_build_voip=true

# Set this to 'true' to enable auto login
_autologin='true'

# set this to 'true' to use clang for compiling (experimental)
#_clang='true'

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git-no-sqlcipher
pkgver=v0.6.3.r705.g1e3d2c2c9
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libxss' 'libmicrohttpd' 'sqlite')
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
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libgnome-keyring')

# Set options for qmake
_options='CONFIG+=no_sqlcipher'
_optClang=''
_optAutol=''
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'

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
		CONFIG+=rs_nodeprecatedwarning \
		${_optAutol} ${_optClang} \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
