# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=sponge-vanilla
_pkgver=1.12.2
_build=7.3.0
pkgver="${_pkgver}_${_build}"
pkgrel=1
pkgdesc="SpongeVanilla is the SpongeAPI implementation for Vanilla Minecraft."
arch=('any')
url="https://www.spongepowered.org/"
license=('MIT')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
backup=('etc/conf.d/sponge-vanilla')
install="${pkgname}.install"
source=("${pkgname}.${pkgver}.jar"::"https://repo.spongepowered.org/maven/org/spongepowered/spongevanilla/${_pkgver}-${_build}/spongevanilla-${_pkgver}-${_build}.jar"
	"${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
	"LICENSE.txt"::"https://raw.githubusercontent.com/SpongePowered/SpongeVanilla/stable-7/LICENSE.txt")
noextract=("papermc.${pkgver}.jar")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
