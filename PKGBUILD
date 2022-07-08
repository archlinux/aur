# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite-git
_pkgname=cuberite
_pkgver=1.12
_build_i686=1024
_build_x86_64=1049
_build_arm=1006
pkgver=1.13.20220709.a2b19de07
pkgrel=1
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client. - Git Version."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
license=('Apache')
makedepends=('cmake' 'git' 'gtest')
depends=('lua' 'screen' 'sudo' 'bash' 'pkcs11-helper' 'sqlite')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${_pkgver%_*}" "spigot=${_pkgver%_*}" "$_pkgname=${pkgver}")
conflicts=('cuberite')
backup=('etc/conf.d/cuberite')
install="${_pkgname}.install"
source=("${_pkgname}-backup.service"
	"${_pkgname}-backup.timer"
	"${_pkgname}.service"
	"${_pkgname}.conf"
	"${_pkgname}.sh"
	"${pkgname}::git+https://github.com/cuberite/cuberite.git")
sha512sums=('4a84419f3a532d2c34cef0a77cd30dded10a771b9d89e7d9d2b2af18808ff037dba68f84331a24ace5cb8c47436fe781b97b5d8a600127161ca55aaca07ecbae'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            'da50c79c539a6250e08f77e02f1c18560463aaab6b128907e209695d3567183bb38f01049b9eb3dc615c0a8d3af2f672fe7652f00b35b6773e46334e5d0f2727'
	    'SKIP')


_game="cuberite"
_server_root="/srv/cuberite"

prepare() {
cd ${srcdir}/${pkgname}
##### to avoid it doing it later in the compile script...
git submodule sync; git submodule update --init
}

pkgver() {
  cd ${srcdir}/${pkgname}
  ##### This is just a Temporary measure. So we can have a valid Version Number... - Borrowed from my openra-git pkgbuild.
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  echo "1.13."$DATE""$PV | sed -e 's/git-/./g'
}

build() {
cd ${srcdir}/${pkgname}
##### Was trying to do this 'Better' for testing.... 
##### Complex Way...
if [ -e Build ]; then
rm -r Build
fi
mkdir Build
cd Build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=off -DBUILD_STATIC_LIBS=on -DBUILD_TOOLS=on -DCMAKE_INSTALL_PREFIX=${_server_root} -DENABLE_PROGRAMS=on -DENABLE_ZLIB_SUPPORT=on -DEVENT__DISABLE_BENCHMARK=off -DEVENT__DISABLE_OPENSSL=off -DEVENT__DISABLE_REGRESS=off -DEVENT__DISABLE_SAMPLES=off -DEVENT__DISABLE_TESTS=off -DEVENT__ENABLE_GCC_HARDENING=on -DFMT_DOC=on -DFMT_INSTALL=off -DFMT_PEDANTIC=on -DFMT_TEST=on -DFMT_USE_CPP11=on -DJSONCPP_WITH_POST_BUILD_UNITTEST=on -DJSONCPP_WITH_TESTS=on -DLIBRARY_INSTALL_DIR=/srv/cuberite/lib -DLINK_WITH_PTHREAD=off -DSQLITECPP_BUILD_EXAMPLES=on -DSQLITECPP_BUILD_TESTS=on -DSQLITECPP_RUN__CPPLINT=on -DSQLITECPP_RUN_DOXYGEN=on -DSQLITE_ENABLE_COLUMN_METADATA=on -DUSE_STATIC_MBEDTLS_LIBRARY=on -DUSE_SHARED_MBEDTLS_LIBRARY=off -DUSE_PKCS11_HELPER_LIBRARY=on -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" ..
make
#####
##### "Easy" way...
#####./compile.sh -m Release -t$(echo $MAKEFLAGS | sed 's/-j//g')
#####
}

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	cd ${srcdir}/${pkgname}/Build
	make DESTDIR="${pkgdir}" install	
	cd ${srcdir}/${pkgname}
	# Copy files to the server destination and create some dirs
	mkdir -p "${pkgdir}/${_server_root}/backup"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	cp -dpr --no-preserve=ownership Server/. "${pkgdir}/${_server_root}"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
