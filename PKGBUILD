# Maintainer: Johannes Joens <johannes@joens.email>

pkgname=waterfall
pkgver=369
pkgrel=1
pkgdesc="A fork of BungeeCord to improve performance and stability."
arch=('any')
url="https://papermc.io/"
license=('MIT')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create backups"
	"netcat: required in order to suspend an idle server")
makedepends=('wget')
backup=('etc/conf.d/waterfall')
install="${pkgname}.install"
source=("${pkgname}.${pkgver}.jar"::"https://papermc.io/ci/job/Waterfall/lastSuccessfulBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar"
	"${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
	"LICENSE.txt"::"https://raw.githubusercontent.com/PaperMC/Waterfall/master/LICENSE.txt")
noextract=("${pkgname}.${pkgver}.jar")
sha512sums=('SKIP'
            'ea7d97c4193efca14a286fd72dbf44c0b20ec94be40c5da646c141f7cd30d1e67c07349f2d1edc5e08489b0aecec4d940ea8fbca6da03ebd1f04802a67262f63'
            '2e21b6e5c9bc4ca4ea7cedd79811afcb4a9b0dc0f51a92fa2bc4dcf33f0f7ef88a165e3621cb4752877c69758bba651016761c69e53f9be93ce7c3c2a372c1a4'
            '6a65fd2d0e18000b79adfa3ad640b0c2f1329f2210cbd922f22d2bb957ca8b336e76707c12f859c9fab7d9eca65bf6833756d22da0f92603c54fab5f9ca1dbf2'
            '80ed2d6a8fb3f3995e37a17619403697e21dd99d21839e8b807b289113f9fe44e815ebe004f41c371a71182fb0800c09a381a6be0cac53ca3907799b10717244'
            'e55d174655d82eb45b0f9afb3276db7db5feb5b964265a36853f24e6da37d57e8702276e357e1d75234477422a25ac89103d6ac87c11a7e50142e50c6249d1c8'
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
