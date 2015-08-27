# Maintainer: sehraf
# Contributor: stqn

# Set this to true to build and install the plugins
_build_feedreader=true
_build_voip=true

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git
pkgver=v0.6.0.RC2.r123.gb8459b3
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss' 'libmicrohttpd' 'sqlcipher')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

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

	qmake-qt4 CONFIG=release PREFIX='/usr' LIB_DIR='/usr/lib' RetroShare.pro
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install

	# Plugins
	if [[ "$_build_voip" == "true" ]] ; then
		install -D -m 755 \
			"plugins/VOIP/libVOIP.so" \
			"${pkgdir}/usr/lib/retroshare/extensions6/libVOIP.so"
	fi
	if [[ "$_build_feedreader" == "true" ]] ; then
		install -D -m 755 \
			"plugins/FeedReader/libFeedReader.so" \
			"${pkgdir}/usr/lib/retroshare/extensions6/libFeedReader.so"
	fi
}
