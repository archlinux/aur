# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=bungeecord
pkgver=1532
pkgrel=1
pkgdesc="BungeeCord is a sophisticated proxy and API designed mainly to teleport players between multiple Minecraft servers."
arch=('any')
url="https://www.spigotmc.org/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/bungeecord')
install="${pkgname}.install"
_name=bungeecord
_subserver=proxy
source=("${_name}.${pkgver}.jar"::"https://ci.md-5.net/job/BungeeCord/${pkgver}/artifact/bootstrap/target/BungeeCord.jar"
	"${_name}-backup@.service"
	"${_name}-backup.timer"
	"${_name}@.service"
	"${_name}.conf"
	"${_name}.sh"
        "${_subserver}.conf"
        "LICENSE"::"https://raw.githubusercontent.com/SpigotMC/BungeeCord/master/LICENSE")
noextract=("${_name}.${pkgver}.jar")
sha512sums=('dda4f0a3caed7e00a2d253fbb0241f9752ad323cd58fbc0efa9b6494d470c99ed47870649f3e85b65cf67fd060f06a00d3be03e4b71a8da6e4a4192a06a2977e'
            '14c8c1cf8b39f9c418db43be130ca11350df90aa7340b2ff05c6d7a23e8ea1ad8ab6192c80fdbe426428f5e56aaa0a936a46d07dfda340c452584e57ad198c0f'
            '803d9c85560060c7d655a5a232c59133200eb41127c6043c85c588548c1ed074234f66109475bde66109c5e299a6486ca7979714a2ca9a5122f7e3a40fcb14b8'
            '5c7f6c19ed5d1946d5628647d33cb389d4c1415847b1fa040e630b6d5d6fa4c676bb31d91f8bb1824d4d58acfa6c0e5acf8cd4de6ca1fb48ffe545f3c6909967'
            'cff0fd6c59552d90db01e95909db6c45acc9f564284a64a486455d5f47c733dfad32c2a3f1c96cea3fffb0d4fe64cc38ded52b64cba9abb75c5d3b6bd2430bc8'
            '033531864df9c41bef0bbbb29273f12ee2833b5c2878a82e18da7c578bf3f1e9a55d850baed46148e8e8360ad0e902804de4a29650659f95d8e6cd967e17df4b'
            '492fcd81fe787a4804309168781d0f0e45d2080c9b7a89d767ce36dd325ee7c41ab20e2ee18589746a73e31f1538db629f54b8f5d1155f72637f0a9592bc0e87'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')

_server_root="/srv/bungeecord"

package() {
	install -Dm644 ${_name}.conf            "${pkgdir}/etc/conf.d/${_name}"
	install -Dm755 ${_name}.sh              "${pkgdir}/usr/bin/${_name}"
	install -Dm644 ${_name}@.service        "${pkgdir}/usr/lib/systemd/system/${_name}@.service"
	install -Dm644 ${_name}-backup@.service "${pkgdir}/usr/lib/systemd/system/${_name}-backup@.service"
	install -Dm644 ${_name}-backup.timer    "${pkgdir}/usr/lib/systemd/system/${_name}-backup.timer"
        install -Dm644 ${_subserver}.conf       "${pkgdir}${_server_root}/servers/${_subserver}.conf"
	install -Dm644 ${_name}.${pkgver}.jar   "${pkgdir}${_server_root}/servers/${_subserver}/${_name}.${pkgver}.jar"
	ln -s "${_name}.${pkgver}.jar"          "${pkgdir}${_server_root}/servers/${_subserver}/server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/servers/${_subserver}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_name}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"

        install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
