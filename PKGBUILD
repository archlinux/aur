# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.12.2
_commit=cb2201d
pkgver="${_pkgver}c2_${_commit}"
pkgrel=1
_mng_ver=1.0.2
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
license=('Apache')
depends=('lua' 'tmux' 'sudo' 'bash' 'awk' 'sed' 'sqlite')
makedepends=('clang' 'cmake' 'gtest' 'git')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${_pkgver%_*}" "spigot=${_pkgver%_*}")
backup=('etc/conf.d/cuberite')
install="${pkgname}.install"
source=("git+https://github.com/cuberite/cuberite#commit=${_commit}"
	"git+https://github.com/cuberite/Core"
	"git+https://github.com/cuberite/ProtectionAreas"
	"git+https://github.com/cuberite/ChatLog"
	"git+https://github.com/cuberite/SQLiteCpp"
	"git+https://github.com/cuberite/libevent"
	"git+https://github.com/open-source-parsers/jsoncpp"
	"git+https://github.com/cuberite/TCLAP"
	"git+https://github.com/cuberite/cmake-coverage"
	"git+https://github.com/cuberite/expat"
	"git+https://github.com/cuberite/lua"
	"git+https://github.com/cuberite/luaexpat"
	"git+https://github.com/cuberite/sqlite"
	"git+https://github.com/cuberite/toluapp"
	"git+https://github.com/fmtlib/fmt"
	"git+https://github.com/grafi-tt/lunajson"
	"git+https://github.com/cuberite/libdeflate"
	"git+https://github.com/cuberite/polarssl"
	"git+https://github.com/cuberite/luaproxy"
	"minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
# FIXME Including "git+https://github.com/cuberite/polarssl#commit=193f373" yields a ref-error
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '11d708d511b63e5541bcc1dbcaf29abbf7cb9583b1d313028770a39b26b41d48dcba023f7e1d6fe30f3c093d20e10a43363011edd432e5785a4580e5c5f852a6')

_game="cuberite"
_server_root="/srv/cuberite"

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule init
	git config submodule.Server/Plugins/Core.url "${srcdir}"/Core
	git config submodule.Server/Plugins/ProtectionAreas.url "${srcdir}"/ProtectionAreas
	git config submodule.Server/Plugins/ChatLog.url "${srcdir}"/ChatLog
	git config submodule.lib/mbedtls.url "${srcdir}"/polarssl
	git config submodule.lib/SQLiteCpp.url "${srcdir}"/SQLiteCpp
	git config submodule.lib/libevent.url "${srcdir}"/libevent
	git config submodule.lib/jsoncpp.url "${srcdir}"/jsoncpp
	git config submodule.lib/TCLAP.url "${srcdir}"/TCLAP
	git config submodule.lib/cmake-coverage.url "${srcdir}"/cmake-coverage
	git config submodule.lib/expat.url "${srcdir}"/expat
	git config submodule.lib/lua.url "${srcdir}"/lua
	git config submodule.lib/luaexpat.url "${srcdir}"/luaexpat
	git config submodule.lib/sqlite.url "${srcdir}"/sqlite
	git config submodule.lib/tolua++.url "${srcdir}"/toluapp
	git config submodule.lib/fmt.url "${srcdir}"/fmt
	git config submodule.lib/luaproxy.url "${srcdir}"/luaproxy
	git config submodule.Tools/BlockTypePaletteGenerator/lib/lunajson.url "${srcdir}"/lunajson
	git config submodule.lib/libdeflate.url "${srcdir}"/libdeflate
	git submodule update
}

build() {
	cd "${srcdir}/${pkgname}"

	rm -rf build
	mkdir build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DCMAKE_INSTALL_PREFIX=${_server_root} \
		-DLIBRARY_INSTALL_DIR=${_server_root}/lib \
		-DCMAKE_C_FLAGS="${CFLAGS}" \
		-DCMAKE_CXX_FLAGS"${CXXFLAGS}"

	make

	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game} \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=Cuberite \
		SERVER_START_CMD="./Cuberite" \
		all
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game} \
		install

	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install

	# Copy files from the archive to the server destination and create some dirs
	install -dm2755 "${pkgdir}/${_server_root}/backup"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	cp -Lr --no-preserve=ownership "${srcdir}/${pkgname}/build/Server/." "${pkgdir}/${_server_root}"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
