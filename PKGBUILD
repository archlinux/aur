# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_pkgname=cuberite
pkgname=cuberite-bin
_pkgver=1.12.2
_build_i686=294
_build_x86_64=284
_build_armv7h=290
pkgver="${_pkgver}b${_build_x86_64}"
pkgrel=3
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
license=('Apache')
depends=('lua' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${_pkgver%_*}" "spigot=${_pkgver%_*}" "cuberite=${_pkgver}")
conflicts=("cuberite")
backup=('etc/conf.d/cuberite')
install="${_pkgname}.install"
source=("${_pkgname}-backup.service"
	"${_pkgname}-backup.timer"
	"${_pkgname}.service"
	"${_pkgname}.sysusers"
	"${_pkgname}.tmpfiles"
	"${_pkgname}.conf"
	"${_pkgname}.sh")
source_i686=("Cuberite.b${_build_i686}_i686.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-i386/${_build_i686}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build_x86_64}_x86_64.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-x86_64/${_build_x86_64}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build_armv7h}_armv7h.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-armhf/${_build_armv7h}/artifact/Cuberite.tar.gz")
sha512sums=('4b4161558343dd2ec4d6b2be41b958e061df2a41961d9476ac1d38f28530043f99735d20115ba65bdbdc04003582f3ab8beb00b19623aae72ecab81797eb05dc'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '0e82acfe3e907f3976e96aebb146d12f076a26e4478f3330d4f0ded44956624094abc35e56402f6a994fb5852fbc7e901e4e2b8f1ae31f3e82224e6bc15eba0b'
            '09047f4df9591b2d61885c842cbd9abde590b0069945f2e10fd402ad93f0f0abd3c2557e61200388038708960f5d82e22d332efe83cf1acf0895f56dd2e5d5d0'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            'efd901f673e36c9bc0e63fe7ccadcb5ce8fa112f65a0fb7c2ed46cd66840edffb01731e18f22f1f760463474e35a6e7223e0cdf2ef6ba5dedaea6d351ad98f1f')
sha512sums_i686=('a338e9219db3800b76c2ef7f29f1dd95f28e00e2ca67c872c5d839ef34377da43697672925b8f0feaed85f833bd5c143ee5a270ffb7da0b6b13a2d42a269c75d')
sha512sums_x86_64=('abcf2c6455cb3293f3d26ba9fff4297cb4c40aa4192290139a15f7fa34cb82bdd091d6771f627888829e6c5e80c51fbb60ecf0cf04d27f960fd9b8e1ce4f9b33')
sha512sums_armv7h=('c194bc7d60ac05c7919cccae59840c884ee2572a8bfed52889772cb09e21a7f35dc7f052eb81a3a56e4cf217bdcb5e5747be6069190e30f5fec65d5fd3958dd8')
noextract=("Cuberite.b${_build_i686}_i686.tar.gz"
	"Cuberite.b${_build_x86_64}_x86_64.tar.gz"
	"Cuberite.b${_build_armv7h}_armv7h.tar.gz")

_game="cuberite"
_server_root="/srv/cuberite"

prepare() {
	rm -rf Server
	mkdir -p Server
	_build="_build_${CARCH}"
	bsdtar -xf "Cuberite.b${!_build}_${CARCH}.tar.gz" -C Server
}

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	install -Dm644 ${_game}.sysusers          "${pkgdir}/usr/lib/sysusers.d/${_game}.conf"
	install -Dm644 ${_game}.tmpfiles          "${pkgdir}/usr/lib/tmpfiles.d/${_game}.conf"

	# Copy files from the archive to the server destination and create some dirs
	mkdir -p "${pkgdir}/${_server_root}/backup"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	cp -dpr --no-preserve=ownership Server/. "${pkgdir}/${_server_root}"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
