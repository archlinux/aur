# Maintainer: Johannes Joens <johannes@joens.email>

pkgname=travertine
pkgver=156
pkgrel=1
pkgdesc="A fork of Waterfall to add 1.7, and other, protocol support."
arch=('any')
url="https://papermc.io/"
license=('MIT')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create backups"
	"netcat: required in order to suspend an idle server")
makedepends=('wget')
backup=('etc/conf.d/travertine')
install="${pkgname}.install"
source=("${pkgname}.${pkgver}.jar"::"https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar"
	"${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
	"LICENSE.txt"::"https://raw.githubusercontent.com/PaperMC/Travertine/master/LICENSE.txt")
noextract=("${pkgname}.${pkgver}.jar")
sha512sums=('SKIP'
            'c33bfa44428b4b9dfb17abd8df613a7c9b61995417fe7cafe6444b499afe23208496f299f8df32b613520b8d886aa8da3c16824bfc7c6e2bd85def7ab12162bc'
            '8c7dd05ed781c9a5e7feb106e0e04c07bc2503d6a9fb1c9c642431d4d3cde099f3c801704a31d19512c3e89dbab57356a006c9f4284b652a7d1a6a172a3e83a2'
            '80847ed099d70d6d6c2735d2377520f9703445f4cebb38e39ffa69252da597c830448e36e13ab5b44c3b4aae9a08258db0e7ebd4f540da0b395c6c7504363fee'
            'dbeca8fa04f7266b623491150ced524702e684d548ff121e7bdfe8035c6a0dcab23eee8baba8f3784329c0192dbdfac33f27966bb61cdea50318494d0fbcd2f9'
            'eabfc7cd537156601ba525f79312db03a423fa6f8c8056d0148e19d56f30fe849bce685e35773b501be03196943da8e61976d35fbc7abe45e160a58aca6bc9b0'
            'SKIP')
_game="${pkgname}"
_server_root="/srv/${pkgname}"
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

	install -D ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
