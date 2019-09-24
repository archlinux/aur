# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.5.2"
_server_root="/srv/forge-1.5.2"

_minecraft_ver=1.5.2
_pkgver=${_minecraft_ver}-7.8.1.737

pkgname=forge-server-1.5.2
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups" "netcat: required in order to suspend an idle server")
makedepends=('unzip')
backup=("etc/conf.d/${_game}")
install="${pkgname}.install"
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar"
	"fml_libs15.zip"::"https://files.minecraftforge.net/fmllibs/fml_libs15.zip"
	"${_game}d-backup.service"
	"${_game}d-backup.timer"
	"${_game}d.service"
	"${_game}d.conf"
	"${_game}d.sh"
	"LICENSE-fml.txt"
	"MinecraftForge-License.txt"
	"Paulscode IBXM Library License.txt"
	"Paulscode SoundSystem CodecIBXM License.txt")
noextract=("${_game}-${_pkgver}-installer.jar"
	   "fml_libs15.zip")
sha512sums=('0e235e2408b41ea6f1e5d2fc1fd879678b878c76547252130659d044f10be233493455d3e8c6d205d23d4e0faf007dacc5eba4f720d658228bf2d458b97be77e'
            '8b1af5bf172ce6558da9f388227c73557fe07c25e706d003b8bca677f6f72d3e38b12a7c34eefca2c3ddfdd554cfa06cbc1b6e8537b3e1dcc2322c2212bddc32'
            'da3bd3f69a4832cf132a6f1d8c689429a22f3a2726fefec3e9b2592abce2ab5057c9f5268abe49a44f81f4c02559c7f8fe1f06c8e0de1d481fc4184921cc5763'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '9bfdbc13e056b522e29a81602f57d16d64d55fb317011d282fbb52a3d3f109d10a36739d265e1c3233e5e3f1663cdc6b35a23cb00bc6adb36f5f633f830845c0'
            '1d9ee6d8fc4ebfc577ac845e947b2238522c59d3114ceaef5f214927fdcbd1473d66aa1e6fa501a056a6550a6a87b728cb055b04cc5b65a38cb1c1813ca91965'
            '3b3651f4f8e23d908bf745e554b7b6e1cf3f7ea94885113b7127c8703b88689d77c7dd37ef196fbb09874a98e74c809f4dd7518ad5ff30618dd71e1edc3a64da'
            '6d985183ce7f543a33f564ca72138602ce8445e229a013696b90bda869f7dfb07bd2ead8ec3ef419a69ab0790e4050048b06e9d92d2c9145fdf4c11f7805e14e'
            '87d06b528a14ed2e67adcd022d1236a426e3e6a73a45663b3d22ffe7bc05d6026dad2772b2e90056a479eae3e20a9a379a61c31aac6369d4f93474a168b9a292'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
	unzip fml_libs15.zip -d lib
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
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar"  "${pkgdir}${_server_root}/minecraft_server.jar"
	ln -s "${_game}-${_pkgver}.jar" "${pkgdir}${_server_root}/${_game}.jar"

	# Install libraries
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"
	find lib -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
