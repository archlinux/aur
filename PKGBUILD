# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.12.2"
_server_root="/srv/forge-1.12.2"

_minecraft_ver=1.12.2
_pkgver=${_minecraft_ver}-14.23.5.2768

pkgname=forge-server-1.12.2
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
backup=("etc/conf.d/${_game}")
install="${pkgname}.install"
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar"
	"${_game}d-backup.service"
	"${_game}d-backup.timer"
	"${_game}d.service"
	"${_game}d.conf"
	"${_game}d.sh"
	"LICENSE.txt"
	"LICENSE-Paulscode IBXM Library.txt"
	"LICENSE-Paulscode SoundSystem CodecIBXM.txt")
noextract=("${_game}-${_pkgver}-installer.jar")
sha512sums=('fefaabeccd17b98752cbef8bd01f4bce27e351106c256edf6aba92267e0fc4ded36fba089f9b7f5fc2d210e5f7b07bca38d8254a2f4732516720e45a249dc5c2'
            '7647801c4cc3192693030b026986df29c53b4124460556543d7601558f8ef09ce65acd0eae52ee51fe3974589d6c0f09d473992d9e44653519f70f75f9987efa'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'e23afa1b34f666f18e4f3ded3210c11b120678d53ca6fcc075b869b600b40fbb52014478be4f22d9fdd785409487092f4cc952ae79ef85561a3ab2b8bbbd07a9'
            'da2fbd5bc62aa2e26334b32d49839cde771c0ad913414240f997b3e0d662a90cb2f62ed822f96fbcbc726b176017122c73b8624bbdbef9992f1e90ac4478c9cb'
            'e356c5d3cedab6dd74ac1902d2ad355e25060d19e9ae143d0a4f06f78b575a6f5a94c09b724a88ef2c4f463014de1bb49ac26cd0987f61c9034fe5e7bb732904'
            'c890315962cbc180897094b3558e19ef2452f5ad587bb759e2af1808a86be4c925e7ba767746b2f6b54b24b27d66437593000c7406db5d5dc2824b0fff9775bb'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
}

package() {
	install -Dm644 "LICENSE.txt"                                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 "LICENSE-Paulscode IBXM Library.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Paulscode IBXM Library.txt"
	install -Dm644 "LICENSE-Paulscode SoundSystem CodecIBXM.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Paulscode SoundSystem CodecIBXM.txt"

	install -Dm644 "${_game}d.conf"                         "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 "${_game}d.sh"                           "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 "${_game}d.service"                      "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 "${_game}d-backup.service"               "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 "${_game}d-backup.timer"                 "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 "forge-${_pkgver}-universal.jar"         "${pkgdir}${_server_root}/${_game}-${_pkgver}.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
	ln -s "${_game}-${_pkgver}.jar" "${pkgdir}${_server_root}/${_game}.jar"

	# Install libraries
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
