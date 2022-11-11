# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.2.1'
pkgrel=2
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
license=('license-free')
install=skywire.install
backup=("opt/${_pkgname}/{users.db,skywire.json,local}")
_source=("skywire-autoconfig"
"skywire.desktop"
"skywirevpn.desktop"
"skywirevpn.png"
"skywire.png"
"skywire.service"
"skywire-autoconfig.service"
)
source=("${_source[@]}")
sha256sums=('08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c')
sha256sums_x86_64=('d2dd1f6a15eba62cad2838602e8366bb8fe63cf2df00e9f1619a8233e8d20235')
sha256sums_aarch64=('60da7b30dc42b43e469caa5e82d9f2e9413a65a54a15007cf44725cdc334d209')
sha256sums_armv8=('60da7b30dc42b43e469caa5e82d9f2e9413a65a54a15007cf44725cdc334d209')
sha256sums_armv7=('6619e736efc1823517a98f31ec9611d4211674d1b70b17e25c5ae1cfeab556f1')
sha256sums_armv7l=('6619e736efc1823517a98f31ec9611d4211674d1b70b17e25c5ae1cfeab556f1')
sha256sums_armv7h=('6619e736efc1823517a98f31ec9611d4211674d1b70b17e25c5ae1cfeab556f1')
sha256sums_arm=('a66bdfa7ffe83cc770a7955e2aedeccaeef43d71e5597005e063058eba004fe8')
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.2.1-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.2.1-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.2.1-linux-armhf.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.2.1-linux-arm.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( "${source_aarch64[@]}" )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=("${_release_url}-armhf.tar.gz")
source_armv7l=( "${source_armv7[@]}" )
source_armv7h=( "${source_armv7[@]}" )
_binaries=("skywire-cli" "skywire-visor")

package() {
GOBIN="${srcdir}/"
_GOAPPS="${GOBIN}/apps"
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_package
}
#_package function - used in build variants
_package() {
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skybin="${_skydir}/bin"
_skyscripts="${_skydir}/scripts"
_msg2 'creating dirs'
mkdir -p "${_pkgdir}/usr/bin"
mkdir -p "${_pkgdir}/${_skydir}/bin"
mkdir -p "${_pkgdir}/${_skydir}/apps"
mkdir -p "${_pkgdir}/${_skydir}/local"
mkdir -p "${_pkgdir}/${_skydir}/scripts"
mkdir -p "${_pkgdir}/${_systemddir}"
_msg2 'installing binaries'
for _i in "${_binaries[@]}" ; do
	install -Dm755 "${GOBIN}/${_i}" "${_pkgdir}/${_skybin}/"
	ln -rTsf "${_pkgdir}/${_skybin}/${_i}" "${_pkgdir}/usr/bin/${_i}"
 done
_msg2 'installing app binaries'
install -Dm755 "${_GOAPPS}/"* "${_pkgdir}/${_skyapps}/"
for _i in "${_pkgdir}/${_skyapps}/"* ; do
	ln -rTsf "${_i}" "${_pkgdir}/usr/bin/${_i##*/}"
done
_msg2 'Installing scripts'
install -Dm755 "${srcdir}/skywire-autoconfig" "${_pkgdir}/${_skyscripts}/"
ln -rTsf "${_pkgdir}/${_skyscripts}/skywire-autoconfig" "${_pkgdir}/usr/bin/skywire-autoconfig"
_msg2 'Correcting symlink names'
ln -rTsf "${_pkgdir}/${_skybin}/${_pkgname}-visor" "${_pkgdir}/usr/bin/${_pkgname}"
_msg2 'installing dmsghttp-config.json'
install -Dm644 "${srcdir}/dmsghttp-config.json" "${_pkgdir}/${_skydir}/dmsghttp-config.json"
_msg2 'Installing systemd services'
install -Dm644 "${srcdir}/"*.service "${_pkgdir}/${_systemddir}/"
_msg2 'installing desktop files and icons'
mkdir -p "${_pkgdir}/usr/share/applications/" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
install -Dm644 "${srcdir}/"*.desktop "${_pkgdir}/usr/share/applications/"
install -Dm644 "${srcdir}/"*.png "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
}


_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
