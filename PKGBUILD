# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.1.0'
pkgrel=1
_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
#depends=( '' )
install=skywire.install
#_scripts=${_pkgname}-scripts
source=("skywire-autoconfig"
"com.skywire.Skywire.desktop"
"com.skywirevpn.SkywireVPN.desktop"
"skywirevpn.png"
"skywire.png"
"skywire.service"
"skywire-autoconfig.service"
)
sha256sums=('38d3727b36415db682be48025cdc6ea3d3c5cf331893dd59089a562468cab150'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            'e6ea2c7471bcf5bc83e8fd831c047ba61b98eab58ca7c055475714dcf6066539'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c')
sha256sums_x86_64=('ac9acfdbde9a7e09c451ef167dbebb298b887a883b25299bf0be8e8aede6c6dc')
sha256sums_aarch64=('128fa08dbc6e4e4e8bee09d5353cc7ecdfd1a7e894373a7a2148a77a930ec542')
sha256sums_armv8=('128fa08dbc6e4e4e8bee09d5353cc7ecdfd1a7e894373a7a2148a77a930ec542')
sha256sums_armv7=('29bf8938d7f8c4d01ced62cc9c83fa67e4414e8c783aef254af8a53e0d130864')
sha256sums_armv7l=('29bf8938d7f8c4d01ced62cc9c83fa67e4414e8c783aef254af8a53e0d130864')
sha256sums_armv7h=('29bf8938d7f8c4d01ced62cc9c83fa67e4414e8c783aef254af8a53e0d130864')
sha256sums_arm=('71860d197771141fcf13533a117eee31381861642f1a86236a59f60af7b988e6')
#https://github.com/skycoin/skywire/releases/download/v1.0.0/skywire-v1.0.0-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.0.0/skywire-v1.0.0-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.0.0/skywire-v1.0.0-linux-armhf.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.0.0/skywire-v1.0.0-linux-arm.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=("${_release_url}-armhf.tar.gz")
source_armv7l=( ${source_armv7[@]} )
source_armv7h=( ${source_armv7[@]} )

package() {
_msg2 'Creating dirs'
_pkgdir="${pkgdir}"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="usr/lib/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts
mkdir -p ${_pkgdir}/${_systemddir}

_msg2 'installing binaries'
 install -Dm755 ${srcdir}/${_pkgname}-cli ${_pkgdir}/${_skybin}/
 install -Dm755 ${srcdir}/${_pkgname}-visor ${_pkgdir}/${_skybin}/
for _i in ${_pkgdir}/${_skybin}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'installing app binaries'
_apps=${srcdir}/apps
install -Dm755 ${_apps}/* ${_pkgdir}/${_skyapps}/
for _i in ${_pkgdir}/${_skyapps}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Installing scripts'
install -Dm755 ${srcdir}/skywire-autoconfig ${_pkgdir}/${_skyscripts}/
for _i in ${_pkgdir}/${_skyscripts}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

_msg2 'installing dmsghttp-config.json'
install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

_msg2 'Installing systemd services'
install -Dm644 ${srcdir}/*service ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/*.desktop ${_pkgdir}/usr/share/applications/
install -Dm644 ${srcdir}/*.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
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
