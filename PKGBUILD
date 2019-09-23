# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.6.4"
_server_root="/srv/forge-1.6.4"

_minecraft_ver=1.6.4
_pkgver=${_minecraft_ver}-9.11.1.1345

pkgname=forge-server-1.6.4
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups" "netcat: required in order to suspend an idle server")
backup=("etc/conf.d/${_game}")
install="${pkgname}.install"
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar"
	"${_game}d-backup.service"
	"${_game}d-backup.timer"
	"${_game}d.service"
	"${_game}d.conf"
	"${_game}d.sh"
	"LICENSE-fml.txt"
	"MinecraftForge-License.txt"
	"Paulscode IBXM Library License.txt"
	"Paulscode SoundSystem CodecIBXM License.txt")
noextract=("${_game}-${_pkgver}-installer.jar")
sha512sums=('2dd01e05097ada099f8c9e9477f6c7aaee6e472c9ca3d7f52677dc6595ee49191d63a1d0f46ed103ef4def92fb80cbab7bee5929bfe4ef67060c4d69cf6da107'
            '23da0e0205893e3b281c2a6714658e7eb9f207ac782067be5d0b893f82643f227075b48118ff9d8d2f47b7e74f4f7c70672c4a11d079bd2654dac768f6d61257'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '5470856234ed9caa989f7265ecc18ce69f76198abc8f0a12249bf03c9a3ab49024fc25aaeec2bf532bd77f9a93e6f083599b5abd012db9a5271698ef17d07f36'
            '2df7426a8738eae893189c1ad79ccb8ab2dfcb84c5e47d73baf6212098558164bc305ec133ff32073cb1b4e1165f4f8ee47ae3b717a5ad10957b8c82c6f88f6b'
            '4c87b7714fa8c9a0b8bf1559c4f6918cf90917470e27651eba79a229067cca8d2e541da8f664f746d342d860087de56cceaa12f217d6bd014e648b4e9326bb83'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            '87d06b528a14ed2e67adcd022d1236a426e3e6a73a45663b3d22ffe7bc05d6026dad2772b2e90056a479eae3e20a9a379a61c31aac6369d4f93474a168b9a292'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
}

package() {
	install -Dm644 "LICENSE-fml.txt"                             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-fml.txt"
	install -Dm644 "MinecraftForge-License.txt"                  "${pkgdir}/usr/share/licenses/${pkgname}/MinecraftForge-License.txt"
	install -Dm644 "Paulscode IBXM Library License.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/Paulscode IBXM Library License.txt"
	install -Dm644 "Paulscode SoundSystem CodecIBXM License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Paulscode SoundSystem CodecIBXM License.txt"

	install -Dm644 "${_game}d.conf"                          "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 "${_game}d.sh"                            "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 "${_game}d.service"                       "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 "${_game}d-backup.service"                "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 "${_game}d-backup.timer"                  "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 "minecraftforge-universal-${_pkgver}.jar" "${pkgdir}${_server_root}/${_game}-${_pkgver}.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar"  "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
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
