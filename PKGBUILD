# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname="${_pkgname}-git"
conflicts=$_pkgname
pkgver=4.3.11.r3287.4167a9b
#WTH is epoch?
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI. (compiling from git)"
arch=(any)
url="http://tshock.co/xf/"
license=("GPL")
depends=('tmux'
         'mono')
source=("${_pkgname}::git+git://github.com/NyxStudios/TShock.git"
	"apiserver::git+git://github.com/NyxStudios/TerrariaAPI-Server.git"
        'tshock.sh'
        'tshock@.service')

sha512sums=('SKIP' 'SKIP'
            'e73ca357516700bbd4ec5e6529320984b81fc7c6abc882181a9a9b3aad32f0d655b7686470fdbf7a953ce1935a79dbed983397aff0bf7ff26a1611dbcca391fb'
            '563ada981c2e08293462485fd85b2c4e0b190c55ed3bcea4139b955f931d970d97c2bd89fba5b190231e9f2adeddd2c385abd11781bf1a98b13b78b8951bf623')

install=tshock.install

backup=('srv/tshock/tshock/config.json')

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
	git config submodule.TerrariaServerAPI.url "${srcdir}/apiserver"
	git submodule update
}

build() {
	cd "${srcdir}/${_pkgname}"
	MONO_IOMAP=case xbuild TShock.sln
}

package() {
	install -d "${pkgdir}/srv/tshock/ServerPlugins/"
	install -d "${pkgdir}/etc/conf.d/tshock/"
	echo "BASEDIR=/srv/tshock
PORT=7777
WORLDDIR=Terraria/Worlds
WORLD=World1
SIZE=2" > "${pkgdir}/etc/conf.d/tshock/default.conf"

	install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/tshock@.service" "${pkgdir}/usr/lib/systemd/system/tshock@.service"

	#install -Dm644 "${srcdir}/ServerPlugins"/* "${pkgdir}/srv/tshock/ServerPlugins/"
	install -Dm644 "${srcdir}/${_pkgname}/prebuilts/sqlite3.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/${_pkgname}/TShockAPI/bin/Debug/Newtonsoft.Json.dll" "${pkgdir}/srv/tshock/"
	install -Dm644 "${srcdir}/${_pkgname}/TShockAPI/bin/Debug/TerrariaServer.exe" "${pkgdir}/srv/tshock/"
}
