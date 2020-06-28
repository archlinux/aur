# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
_pkgver=1.16.1
_build=3
_license_commit=11de41c777
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
	"LICENSE_${pkgver}.md"::"https://raw.githubusercontent.com/PaperMC/Paper/${_license_commit}/LICENSE.md")
noextract=("papermc.${pkgver}.jar")
sha512sums=('fb34b25458df087ab3d6fb4f772efeca2f076286506218717656b0b51cbe1567d87a833a281f7328794967657620358cac960d3122c13d995730a38e6cc0a768'
            'a4fcc9f28436c0163e9414f2793fcbd4f6ea74772230cdff4a628246eae2a8008688b3dfb94d433f8f0887cd7eea3fe43ce25f9d5812d46e62179ff315b62895'
            '51c5345155e8640d4f1eaef0c8cfb890ae46063f2d4e7a0fe181ad4c8ff7b96fea88b0f9fc74031d589dfd61602f37b440f183ca1859835930fe69d37508cd42'
            'f29c4044d9e3cc5ab137c21f7e62399b36d7e1f777d5558a39f7b4a01de75bdf2de0b8678e424accc03934ca7db9ebb6a22c78c8c4497759287dd55e1c3eb456'
            '70f7d4e42db9ed5efcde412f018d46628ad9c12198787421cc70aa1e51b8e278b436d480568ca21dabaacf33cfbd37c5e607504f2cd25ed65442ba67b9805958'
            'c777e62beb213b5203883e13045953daa3d054c59da8ab535d416464366790edfe77fd9517f968d140dfb4c9009f7e8152f693312364ebbdc71cf2148d6a7df4'
            '3edf367c6f16736367159adc9f56742f0fa86abc4dbb115e7f8e2c1060b618f8f292919929aeeca755ddc90c0c39be13733149e2c4a114990536aac2084e1b91')

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

	install -D ./LICENSE_${pkgver}.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
