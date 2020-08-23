# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=bungeecord
pkgver=1532
pkgrel=3
pkgdesc="BungeeCord is a sophisticated proxy and API designed mainly to teleport players between multiple Minecraft servers."
arch=('any')
url="https://www.spigotmc.org/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/bungeecord')
install="${pkgname}.install"
_subserver=proxy

source=("${pkgname}.${pkgver}.jar"::"https://ci.md-5.net/job/BungeeCord/${pkgver}/artifact/bootstrap/target/BungeeCord.jar"
	"${pkgname}-backup@.service"
	"${pkgname}-backup.timer"
	"${pkgname}@.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
        "${_subserver}.conf"
        "LICENSE"::"https://raw.githubusercontent.com/SpigotMC/BungeeCord/master/LICENSE")

noextract=("${pkgname}.${pkgver}.jar")

_server_root="/srv/bungeecord"

package() {
	install -Dm644 ${pkgname}.conf            "${pkgdir}/etc/conf.d/${pkgname}"
	install -Dm755 ${pkgname}.sh              "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}@.service        "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
	install -Dm644 ${pkgname}-backup@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup@.service"
	install -Dm644 ${pkgname}-backup.timer    "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.timer"
        install -Dm644 ${_subserver}.conf       "${pkgdir}${_server_root}/servers/${_subserver}.conf"
	install -Dm644 ${pkgname}.${pkgver}.jar   "${pkgdir}${_server_root}/servers/${_subserver}/${pkgname}.${pkgver}.jar"
	ln -s "${pkgname}.${pkgver}.jar"          "${pkgdir}${_server_root}/servers/${_subserver}/server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/servers/${_subserver}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${pkgname}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"

        install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha512sums=('dda4f0a3caed7e00a2d253fbb0241f9752ad323cd58fbc0efa9b6494d470c99ed47870649f3e85b65cf67fd060f06a00d3be03e4b71a8da6e4a4192a06a2977e'
            '14c8c1cf8b39f9c418db43be130ca11350df90aa7340b2ff05c6d7a23e8ea1ad8ab6192c80fdbe426428f5e56aaa0a936a46d07dfda340c452584e57ad198c0f'
            '803d9c85560060c7d655a5a232c59133200eb41127c6043c85c588548c1ed074234f66109475bde66109c5e299a6486ca7979714a2ca9a5122f7e3a40fcb14b8'
            '5c7f6c19ed5d1946d5628647d33cb389d4c1415847b1fa040e630b6d5d6fa4c676bb31d91f8bb1824d4d58acfa6c0e5acf8cd4de6ca1fb48ffe545f3c6909967'
            'cff0fd6c59552d90db01e95909db6c45acc9f564284a64a486455d5f47c733dfad32c2a3f1c96cea3fffb0d4fe64cc38ded52b64cba9abb75c5d3b6bd2430bc8'
            'dd9aa1da23f134a9418f060baf693050e648bebe034f1368c145787f082138fbed1f533cfaba95ed245fbf911e690c2427da1cf4132a317eef1c4fc43af29f91'
            '9caffaa6e6bf352794123a7ee659c2d43f5bf9db2108ed140dbca1dd5d8f85cbb09395310eadbc6f3ed2718bf5546e1b668be5b2113aa5dcc1a5a9e0105bcac1'
            'SKIP')
