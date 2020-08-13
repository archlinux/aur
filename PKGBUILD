# Maintainer: Johannes Joens <johannes@joens.email>

pkgname=bungeecord
pkgver=1530
pkgrel=1
pkgdesc="BungeeCord is a sophisticated proxy and API designed mainly to teleport players between multiple Minecraft servers."
arch=('any')
url="https://www.spigotmc.org/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create backups"
	"netcat: required in order to suspend an idle server")
makedepends=('wget')
backup=('etc/conf.d/bungeecord')
install="${pkgname}.install"
source=("${pkgname}.${pkgver}.jar"::"https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar"
	"${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
	"LICENSE"::"https://raw.githubusercontent.com/SpigotMC/BungeeCord/master/LICENSE")
noextract=("${pkgname}.${pkgver}.jar")
sha512sums=('SKIP'
            'ea8665bae278bbd2207ae3609f9164cd5d0fa31dcda12eba84754d6b2954b13d4f38ddf13646d2cb73bab151f5717882d848a275b0f4b60c6ccbad754d9bd757'
            '803d9c85560060c7d655a5a232c59133200eb41127c6043c85c588548c1ed074234f66109475bde66109c5e299a6486ca7979714a2ca9a5122f7e3a40fcb14b8'
            'e10652c20caca45d5e353328260ae40bc76b32d37289a21eea93636eb9e4828bb32948bb4eab5a5ebb97dd36dcd62b12e6ab17f49b7ff372111cb33217397aa5'
            'ed20e42216c2f69cb7ac2bea5dcd7d39c82d2be52a86d8f6afe197518d299e97aaea3aaf041d4195a46b9ea2fec72b36433f725d5e05b39f0966e6b89158769b'
            '54c9b1769a9eadb0834aaca22f36045a1a8c061a833bbc0b6a9fc05e361c2e281590c967f97679119d00daa1e962d8d768356641a3dea43ccf3cd922300b834a'
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

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
