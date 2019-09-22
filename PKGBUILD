# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>
# Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.10.2"
_server_root="/srv/forge-1.10.2"

_minecraft_ver=1.10.2
_pkgver=${_minecraft_ver}-12.18.3.2185

pkgname=forge-server-1.10.2
pkgver=${_pkgver//-/_}
pkgrel=2
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
sha512sums=('12ef115f29883ee48ddfe0463e5a817d8754fba776d97951347b9d657227836f148c392df49eaed61887f7fb7f8653321ba419e07d34df89e76888e42f2283ae'
            'c56f06606d96a08e7b55ef00e95d57d2931218f2e887f70a2be092dc20e47a3fc40c4898a5d315964f08126eb4860c8d7925e26bc52acf0dbaf681e6906f2915'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '1c97696602817701590faac010855702f74e1a4c9b628e6c27b53187dc27fd563a57f2027cd3af94377bf189b48fdd8e5b154b2b9314bec893234cdf4100c175'
            '78578e1e736d946ff09c4f2eeaa9a667d5baeb56918dc702b9eae6969aaf62369207612e6825d0b4f88cd70ec5f120400d7badcbe95255a5486077805c60d730'
            '9f2d532dd2f7c897f6082aee8a1164fcd9f639e49bd1f025ae2b6ca7a97560ad0b34971a618eb669cdfc19a86426850bae4c7600805a4ce9fc40576154971f08'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            '7fe8163f3f1bb86e59508aff851eb571e280da36c24a6faf49ae51d6a000282bac8c388ac1c0c1208220b3f8fb62466285a306213f5a014faa1b619f4c48bf9b'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15')

prepare() {
	mkdir mods
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
	install -Dm644 "mods/mod_list.json"                     "${pkgdir}${_server_root}/mods/mod_list.json"
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
