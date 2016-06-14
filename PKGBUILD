# Maintainer: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

# Set this to true to build and install the plugins
_build_feedreader=true
_build_voip=true

### Nothing to be changed below this line ###

pkgname=retroshare
pkgver=0.6.0
pkgrel=4
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

source=("https://github.com/RetroShare/RetroShare/archive/v${pkgver}.tar.gz"
        'https://github.com/RetroShare/RetroShare/commit/aca88308eae16ab67627593c0df2fce7beb02e89.patch')
sha256sums=('50b9157bbe407aaefcbf9af1f29392e63148dc060bf78a3b200c9bc09998cf7c'
            '63948e67819c529999b93e2af089522e03491970894dbe922cd57730927cbd74')

# Add missing dependencies if needed
[[ $_build_voip == true ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

prepare() {
	cd "${srcdir}/RetroShare-${pkgver}"
	git apply ../aca88308eae16ab67627593c0df2fce7beb02e89.patch
}

build() {
	cd "${srcdir}/RetroShare-${pkgver}"

	# remove unwanted plugins
	if [[ "$_build_voip" != 'true' ]] ; then
		sed -i '/VOIP \\/d' plugins/plugins.pro
	fi
	if [[ "$_build_feedreader" != 'true' ]] ; then
		sed -i '/FeedReader/d' plugins/plugins.pro
	fi

	# call version scripts
	cd libretroshare/src
	LANG=C ./version_detail.sh
	cd ../..

	cd retroshare-gui/src
	LANG=C ./version_detail.sh
	cd ../..

	# qt4: qmake-qt4 -r ...
	qmake   "CONFIG-=debug" "CONFIG+=release"\
		QMAKE_CFLAGS_RELEASE="${CFLAGS}"\
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"\
		RetroShare.pro
	make
}

package() {
	cd "${srcdir}/RetroShare-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
