# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
_pkgver=1.16.5
_build=778
_license_commit=b7976b9
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
sha512sums=('0f402d0a8ae0c733ac115708296b480eb63b9dd9d6c690ca2146ceb6dcca5e2c13d55560de1aa23ae28bafe15447777e87d7e5ea77b621c758d90129463279f7'
            'a4fcc9f28436c0163e9414f2793fcbd4f6ea74772230cdff4a628246eae2a8008688b3dfb94d433f8f0887cd7eea3fe43ce25f9d5812d46e62179ff315b62895'
            '51c5345155e8640d4f1eaef0c8cfb890ae46063f2d4e7a0fe181ad4c8ff7b96fea88b0f9fc74031d589dfd61602f37b440f183ca1859835930fe69d37508cd42'
            'f29c4044d9e3cc5ab137c21f7e62399b36d7e1f777d5558a39f7b4a01de75bdf2de0b8678e424accc03934ca7db9ebb6a22c78c8c4497759287dd55e1c3eb456'
            'fe268d7380f881229100700b1d4f4897904a630aa65b0b06bba08be5d5918f208d497e01fc5306deecd5d93a78cfdb7e9c7f1c3b910b3a414ce9af186a05224d'
            '1982a9628e775a6ffad7c72718378d9b84b70e932a9adc0cf5fd467bfba033b62ef77a9c5f41b6d7062fcf2ab6044d4a248e31191b8e00c5e76ef6fc36eb5053'
            'c40cba5dfbf5af5d206cd42fa2b43f2321b481f83ab79c9ce4eaa76f204abab48ff2d8b8526a1a3d82636be97f18596d4343b0efc72a7082642e4af8d1b561c5'
            '115fe7213d7edd0e3159607a31b28edb6e6b3bd1d454d516973e38c8cf0b803275c2c4e59b29e2260561270d931c71bad134046535e5add309e0a8d055cde0ff'
            '9b60b6b3655edff4782f713eeef0cd02879ca18f545f757346e07f5a693948d5ab60dc9c74ad7a94f8bea09dda90993d4b501fd98d98b4f7ef1d5dfaf40e2f16')

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
