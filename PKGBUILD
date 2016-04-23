# Maintainer: sehraf
# Contributor: stqn
# Mod Fanch

ncpu=$(grep processor /proc/cpuinfo|wc -l)
make_option="-j${ncpu}"

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git-no-sqlcipher
pkgver=v0.6.0.r392.gd696f72
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

#qt 5
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd' 'sqlite')
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


pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# remove unwanted plugins
	sed -i '/VOIP \\/d' plugins/plugins.pro
	sed -i '/FeedReader/d' plugins/plugins.pro

	# call version scripts
	cd libretroshare/src
	LANG=C ./version_detail.sh
	cd ../..

	cd retroshare-gui/src
	LANG=C ./version_detail.sh
	cd ../..


	export LANG=C
	qmake "DEFINES+=NO_SQLCIPHER" "CONFIG+=NO_SQLCIPHER" "CONFIG-=debug" "CONFIG+=release" QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" RetroShare.pro
	make "${make_option}"
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
