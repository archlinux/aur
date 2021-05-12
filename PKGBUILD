# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
_pkgver=1.16.5
_build=662
_license_commit=4a7962c
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
	"papermc.tmpfiles"
	"papermc.sysusers"
	"LICENSE_${pkgver}.md"::"https://raw.githubusercontent.com/PaperMC/Paper/${_license_commit}/LICENSE.md")
noextract=("papermc.${pkgver}.jar")
sha512sums=('ac3ff826442f8f35a16d7fe198dd67a51452be5566081d00556a9b2afff5a56037738780469654f85d25c58dc41a98b126ba361c673aed46587546844195ae1e'
            'a4fcc9f28436c0163e9414f2793fcbd4f6ea74772230cdff4a628246eae2a8008688b3dfb94d433f8f0887cd7eea3fe43ce25f9d5812d46e62179ff315b62895'
            '51c5345155e8640d4f1eaef0c8cfb890ae46063f2d4e7a0fe181ad4c8ff7b96fea88b0f9fc74031d589dfd61602f37b440f183ca1859835930fe69d37508cd42'
            'f29c4044d9e3cc5ab137c21f7e62399b36d7e1f777d5558a39f7b4a01de75bdf2de0b8678e424accc03934ca7db9ebb6a22c78c8c4497759287dd55e1c3eb456'
            'fe268d7380f881229100700b1d4f4897904a630aa65b0b06bba08be5d5918f208d497e01fc5306deecd5d93a78cfdb7e9c7f1c3b910b3a414ce9af186a05224d'
            '3095ccd94c1918b71ee267dc7d0a429276d732422d660f3162ad5cb16c675cebfc4c12d9acfb7852b4245590b61517bd151b93aac24fddb4ebb3ef23f812d3c5'
            'c40cba5dfbf5af5d206cd42fa2b43f2321b481f83ab79c9ce4eaa76f204abab48ff2d8b8526a1a3d82636be97f18596d4343b0efc72a7082642e4af8d1b561c5'
            '115fe7213d7edd0e3159607a31b28edb6e6b3bd1d454d516973e38c8cf0b803275c2c4e59b29e2260561270d931c71bad134046535e5add309e0a8d055cde0ff'
            'd4c645a58e1a17a0a1e42856a3cc43097711a05bf3d9f18c77c3bc9874417f223552859042ff00b7d3dda0003f49a9ee568540c2eb24e9f8fbb3c055f3b6e0a5')

_game="papermc"
_server_root="/srv/papermc"

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	install -Dm644 ${_game}.sysusers          "${pkgdir}/usr/lib/sysusers.d/${_game}.conf"
	install -Dm644 ${_game}.tmpfiles          "${pkgdir}/usr/lib/tmpfiles.d/${_game}.conf"
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
