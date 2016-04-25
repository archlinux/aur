# Maintainer: sehraf
# Contributor: stqn

# Set this to 'true' to build and install the plugins
_build_feedreader=true
_build_voip=true

# set this to 'true' to use clang for compiling (experimental)
_clang=

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git
pkgver=v0.6.0.r395.g0d84a55
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd' 'sqlcipher' 'desktop-file-utils')
makedepends=('git' 'qt5-tools')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/RetroShare/RetroShare.git"
        'retroshare.install')

sha256sums=('SKIP'
            '44ea7d8b0208e8954391184dcbb8ff94b2efc246580057a1d2b2e73ad262aad2')

# Add missing dependencies if needed
[[ "$_build_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_build_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')

# Set options for qmake
_options=''
[[ "$_clang" == 'true' ]] && _options='-spec linux-clang'

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

	qmake   "${_options}" \
		CONFIG-=debug CONFIG+=release \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
