# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.12.2
_commit=1be14eb
pkgver="${_pkgver}c1_${_commit}"
pkgrel=1
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
	"${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}.conf"
	"${pkgname}.sh")
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
            '4b4161558343dd2ec4d6b2be41b958e061df2a41961d9476ac1d38f28530043f99735d20115ba65bdbdc04003582f3ab8beb00b19623aae72ecab81797eb05dc'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '0e82acfe3e907f3976e96aebb146d12f076a26e4478f3330d4f0ded44956624094abc35e56402f6a994fb5852fbc7e901e4e2b8f1ae31f3e82224e6bc15eba0b'
            '09047f4df9591b2d61885c842cbd9abde590b0069945f2e10fd402ad93f0f0abd3c2557e61200388038708960f5d82e22d332efe83cf1acf0895f56dd2e5d5d0'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            'efd901f673e36c9bc0e63fe7ccadcb5ce8fa112f65a0fb7c2ed46cd66840edffb01731e18f22f1f760463474e35a6e7223e0cdf2ef6ba5dedaea6d351ad98f1f')

_game="cuberite"
_server_root="/srv/cuberite"

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule init
	git config submodule.Server/Plugins/Core.url "${srcdir}"/Core
	git config submodule.Server/Plugins/ProtectionAreas.url "${srcdir}"/ProtectionAreas
	git config submodule.Server/Plugins/ChatLog.url "${srcdir}"/ChatLog
	#git config submodule.lib/mbedtls.url "${srcdir}"/polarssl
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
}

package() {
	make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install

	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	install -Dm644 ${_game}.sysusers          "${pkgdir}/usr/lib/sysusers.d/${_game}.conf"
	install -Dm644 ${_game}.tmpfiles          "${pkgdir}/usr/lib/tmpfiles.d/${_game}.conf"

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
