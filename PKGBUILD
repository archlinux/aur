# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
_pkgver=1.14.4
_build=196
pkgver="${_pkgver}+b${_build}"
pkgrel=1
pkgdesc="Next generation of Minecraft server, compatible with Spigot plugins and offering uncompromising performance"
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
conflicts=('papermc-git')
backup=('etc/conf.d/papermc')
install="${pkgname}.install"
source=("papermc.${pkgver}.jar"::"https://papermc.io/api/v1/paper/${_pkgver}/${_build}/download"
	"papermc-backup.service"
	"papermc-backup.timer"
	"papermc.service"
	"papermc.conf"
	"papermc.sh"
	"papermc_${pkgver}_LICENSE.md"::"https://raw.githubusercontent.com/PaperMC/Paper/master/LICENSE.md")
noextract=("papermc.${pkgver}.jar")
sha512sums=('7ba9cf2fa97b79510dcd026cb3defdb9d907b874cea17491becc9adfb109d0a775a5ec40a48d70bd6a843302d6d5af4c46100ee35c9478fe58568516f32335bf'
            'f4126f9cbb3fa24096c22812c45d33b07891317a5a505646fc11c69a5d25ad8679cd6c82ab1285013b2d29d1b73a753bc85d30b66c375768ab6e27d82c6d2092'
            '51c5345155e8640d4f1eaef0c8cfb890ae46063f2d4e7a0fe181ad4c8ff7b96fea88b0f9fc74031d589dfd61602f37b440f183ca1859835930fe69d37508cd42'
            'f29c4044d9e3cc5ab137c21f7e62399b36d7e1f777d5558a39f7b4a01de75bdf2de0b8678e424accc03934ca7db9ebb6a22c78c8c4497759287dd55e1c3eb456'
            '70f7d4e42db9ed5efcde412f018d46628ad9c12198787421cc70aa1e51b8e278b436d480568ca21dabaacf33cfbd37c5e607504f2cd25ed65442ba67b9805958'
            '0ebbf99905decb79b0acfb3c0357e990afe619c62745cdb0ef2fda7c8b50206c7904ca99a9f3ecb8e8c4f83286640575a3c63286d8ed0348cd16124bc285852e'
            '687c51e16de4e5081066640228664e5aa642e8b61f22ae406b7385eba291c93f21ea7c1b625f27331e88936d405631b996089994d99e5201b71505e5fd08a294')

_game="papermc"
_server_root="/srv/papermc"

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	install -Dm644 ${_game}.${pkgver}.jar     "${pkgdir}/${_server_root}/${_game}.${pkgver}.jar"
	ln -s "${_game}.${pkgver}.jar" "${pkgdir}${_server_root}/${_game}_server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"

	install -D ./papermc_${pkgver}_LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
