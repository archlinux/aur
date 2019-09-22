# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.7.10"
_server_root="/srv/forge-1.7.10"

_minecraft_ver=1.7.10
_pkgver=${_minecraft_ver}-10.13.4.1558

pkgname=forge-server-1.7.10
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
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}-${_minecraft_ver}/forge-${_pkgver}-${_minecraft_ver}-installer.jar"
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
sha512sums=('e3c733d16e7977cf2914a929650c361b43bbaee3fd4c3329d473455657d0970a92e45f175c9109ea72ea0992d7d9171468714daf8deeb4ae63bd8aed8a0ba7cb'
            '7d1435121c01afd31eab75be12f5397787b1596ad412ba84364b3fe2a70cc2887ac74b7ac3c7949d2f747afc455dfacc09408659c106063cff6cdcd510eed2f6'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '6d5c1543506ba179d0dd7b0b84f923d4040968628669df8f01cf8c647fa71cb26a7e168aa839fc9dbf4944e542dc93d7df03c29ec38015ed216c9165b6368b67'
            'f36698f182b8311112c701e0ced913587c9e038ba885fc08d66520976dda80e23cd0a6149b6bb0b3431e0d89527f65894de8a2570beccf2746e64358fbe00f68'
            '3a7c1db005736b8c27bf94bf4a9c329e68e9aab74d9cdaf8e90f130b14e25d15de478c6880f465f17a610716cbdf3f385b2a1fade58c45db665ae692362a8ad7'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15'
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

	install -Dm644 "${_game}d.conf"                                   "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 "${_game}d.sh"                                     "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 "${_game}d.service"                                "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 "${_game}d-backup.service"                         "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 "${_game}d-backup.timer"                           "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 "forge-${_pkgver}-${_minecraft_ver}-universal.jar" "${pkgdir}${_server_root}/${_game}-${_pkgver}.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar"           "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
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
