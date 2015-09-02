# Maintainer: sehraf
# Contributor: stqn

# Set this to true to build and install the plugins
_build_feedreader=false
_build_voip=false

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git-no-sqlcipher
pkgver=v0.6.0.RC2.r126.g6e1a8fa
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

install='retroshare.install'

source=("${_pkgname}::git+https://github.com/RetroShare/RetroShare.git"
		'retroshare.install')

sha256sums=('SKIP'
            '44ea7d8b0208e8954391184dcbb8ff94b2efc246580057a1d2b2e73ad262aad2')

# Add missing dependencies if needed
[[ $_build_voip == true ]] && depends=(${depends[@]} 'speex' 'opencv')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# remove unwanted plugins
	if [[ "$_build_voip" != "true" ]] ; then
		sed -i '/VOIP \\/d' plugins/plugins.pro
	fi
	if [[ "$_build_feedreader" != "true" ]] ; then
		sed -i '/FeedReader/d' plugins/plugins.pro
	fi

	# call version scripts
	cd libretroshare/src
	LANG=C ./version_detail.sh
	cd ../..

	cd retroshare-gui/src
	LANG=C ./version_detail.sh
	cd ../..

	qmake-qt4 CONFIG=release DEFINES+=NO_SQLCIPHER CONFIG+=NO_SQLCIPHER PREFIX='/usr' LIB_DIR='/usr/lib' RetroShare.pro
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
