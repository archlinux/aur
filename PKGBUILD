# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.9.4"
_server_root="/srv/forge-1.9.4"

_minecraft_ver=1.9.4
_pkgver=${_minecraft_ver}-12.17.0.1976

pkgname=forge-server-1.9.4
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
	"LICENSE-new.txt"
	"MinecraftForge-License.txt")
noextract=("${_game}-${_pkgver}-installer.jar")
sha512sums=('0f81a142a8dab015734f573fa20cf7089fe6020c23597d72a35a8e4f1e85cf7746aead735c2db6c5f33d186f77ad8a288899c1f7abf5c9b5521bf02031da5382'
            'cb12850b8aed8cd8a624e86ede13a79613cbd5734ad8f898eeeb00813b168fce1d6a46e0d811b0d1528669826ded044c7f528dbd42744d1e901ca2d773e6f6f7'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '0ce70357697009b986850c8aa2c29f874a99c656c44b2eb903b8ac445ef87e03fa7c2eca9091e435f983018bb678d41a18d63c0e73f0b2dd35aaf1c53d35abd9'
            '3a5a2609d7e2b387b410276ad443265cf669ded719eb8a4162fc3c920040dc3e562cb0e861697828d00244fc3c2525084d9851aca4e5f9dff3e3de0ca9d4afb0'
            '1cd03db8ff6cf98a59ac669ad6b78e1a8e4ee808e13e17a3c39b884f586ff96636f6d77a857581a6648d4c2d2e9202935404ae443e3c3c696407b829a9f4765b'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            '7fe8163f3f1bb86e59508aff851eb571e280da36c24a6faf49ae51d6a000282bac8c388ac1c0c1208220b3f8fb62466285a306213f5a014faa1b619f4c48bf9b'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
}

package() {
	install -Dm644 "LICENSE-fml.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-fml.txt"
	install -Dm644 "LICENSE-new.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-new.txt"
	install -Dm644 "MinecraftForge-License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/MinecraftForge-License.txt"

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
