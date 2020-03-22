# Maintainer: sehraf
# Contributor: stqn

# Set this to 'true' to build and install the plugins
#_plugin_feedreader='true'
#_plugin_voip='true'

# Set this to 'true' to enable the new automatically generated jsaon api
#_jsonapi='true'

# Set this to 'true' to enable auto login
#_autologin='true'

# Set this to 'true' to enable wiki functionality (experimental)
#_wiki='true'

# Set this to 'true' to use clang for compiling (experimental)
#_clang='true'

# Unofficial plugins
#_plugin_lua4rs='true'

# INCOMPATIBLE OPTION - Do not swtich between different version with this enabled and disbaled! RetroShare required _manual_ migration!
# Set this to 'true' to not used an encrypted database. This will likely enhance your performance.
#_no_sqlcipher='true'

### Nothing to be changed below this line ###

_pkgname=retroshare
pkgname=${_pkgname}-git
pkgver=v0.6.5.r1153.gdb42c7a97
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://retroshare.cc/'
license=('GPL' 'LGPL')
depends=('qt5-multimedia' 'qt5-x11extras' 'libupnp' 'libxss' 'libmicrohttpd' 'xapian-core')
makedepends=('git' 'qt5-tools' 'rapidjson')
optdepends=('tor: tor hidden node support'
            'i2p: i2p hidden node support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/RetroShare/RetroShare.git")
sha256sums=('SKIP')

# Add sql dependency
[[ "$_no_sqlcipher" == 'true' ]] && depends=(${depends[@]} 'sqlite') || depends=(${depends[@]} 'sqlcipher')
_optSql=''
[[ "$_no_sqlcipher" == 'true' ]] && _optSql='CONFIG+=no_sqlcipher'

# Add missing dependencies if needed
[[ "$_plugin_voip" == 'true' ]] && depends=(${depends[@]} 'ffmpeg' 'opencv')
[[ "$_plugin_feedreader" == 'true' ]] && depends=(${depends[@]} 'curl' 'libxslt')
[[ "$_jsonapi" == 'true' ]] && depends=(${depends[@]} 'restbed') && makedepends=(${makedepends[@]} 'cmake' 'doxygen')
[[ "$_clang" == 'true' ]] && makedepends=(${makedepends[@]} 'clang')
[[ "$_autologin" == 'true' ]] && depends=(${depends[@]} 'libsecret')

# Set options for qmake
_optJsonapi=''
_optClang=''
_optAutol=''
_optPlugin=''
_optWiki=''
[[ "$_jsonapi" == 'true' ]] && _optJsonapi='CONFIG+=rs_jsonapi'
[[ "$_clang" == 'true' ]] && _optClang='-spec linux-clang CONFIG+=c++11'
[[ "$_autologin" == 'true' ]] && _optAutol='CONFIG+=rs_autologin'
([[ "$_plugin_voip" == 'true' ]] || [[ "$_plugin_feedreader" == 'true' ]] || [[ "$_plugin_lua4rs" == 'true' ]]) && _optPlugin='CONFIG+=retroshare_plugins'
[[ "$_wiki" == 'true' ]] && _optWiki='CONFIG+=wikipoos'

# Handle unofficial plugins
if [[ "$_plugin_lua4rs" == 'true' ]] ; then
	depends=(${depends[@]} 'lua')
	source=(${source[@]} 'Lua4RS::git+https://github.com/RetroShare/Lua4RS.git')
	sha256sums=(${sha256sums[@]} 'SKIP')
fi

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# Handle unofficial plugins
	if [[ "$_plugin_lua4rs" == 'true' ]] ; then
		[[ -d 'plugins/Lua4RS' ]] &&  rm -r plugins//Lua4RS
		cp -r -l "${srcdir}/Lua4RS" plugins/
		sed -i -e 's/SUBDIRS += \\/SUBDIRS += \\\n\t\tLua4RS \\/g' plugins/plugins.pro
	fi

	# remove unwanted plugins
	[[ "$_plugin_voip" != 'true' ]] && sed -i '/VOIP \\/d' plugins/plugins.pro
	[[ "$_plugin_feedreader" != 'true' ]] && sed -i '/FeedReader/d' plugins/plugins.pro

	rmdir supportlibs/restbed/include || true
	rmdir /tmp/makepkg/retroshare-git/src/retroshare/supportlibs/cmark/build/src && /tmp/makepkg/retroshare-git/src/retroshare/supportlibs/cmark/build || true

	qmake   CONFIG-=debug CONFIG+=release \
		${_optSql} \
		${_optJsonapi} ${_optAutol} ${_optClang} \
		${_optPlugin} ${_optWiki} \
		QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
		QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
		RetroShare.pro

	make || true
	rmdir supportlibs/restbed/include || true
	make || make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
