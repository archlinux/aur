# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com"
pkgver='1.0.0'
pkgrel=1
_rc='-rc2'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
makedepends=()
depends=()
provides=( 'skywire' )
conflicts=( 'skywire' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${_scripts}.tar.gz" )
sha256sums=('8a5812d246e8d129075b25622219a46fc74a33e1a123724156b084055489bb12')
sha256sums_i686=('96775008409c0cb34384fada6ab332177fbb43ac670d98c66d905543e89b8023')
sha256sums_x86_64=('03ac5a5e71f2c855cd808329b585d845e073e6ec754028bd72a18db8c42070ac')
sha256sums_aarch64=('b4afd149c04f612e1c1bb5edacc768906a4f869945b888160dfcf2b5d6644c41')
sha256sums_armv8=('b4afd149c04f612e1c1bb5edacc768906a4f869945b888160dfcf2b5d6644c41')
sha256sums_armv7=('03514cb6a95ee535e5ca41b54c1fd88e5f4c381a1d87b7c11e5bcdc39a5a975c')
sha256sums_armv7l=('03514cb6a95ee535e5ca41b54c1fd88e5f4c381a1d87b7c11e5bcdc39a5a975c')
sha256sums_armv7h=('03514cb6a95ee535e5ca41b54c1fd88e5f4c381a1d87b7c11e5bcdc39a5a975c')
sha256sums_arm=('03514cb6a95ee535e5ca41b54c1fd88e5f4c381a1d87b7c11e5bcdc39a5a975c')
#https://github.com/skycoin/skywire/releases/download/v0.6.0-rc1/skywire-v0.6.0-rc1-linux-amd64.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=( ${source_arm[@]} )
source_armv7l=( ${source_arm[@]} )
source_armv7h=( ${source_arm[@]} )
source_i686=("${_release_url}-386.tar.gz")

## compress scripts archive & update checksums - now in updates.sh
#  tar -czvf skywire-scripts.tar.gz skywire-scripts && updpkgsums

package() {
_msg2 'Creating dirs'
#create directory trees or the visor might make them with weird permissions
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

_msg2 'Installing binaries'
_binaries=("${_pkgname}-cli" "${_pkgname}-visor")
for i in ${_binaries[@]}; do
_msg3 "${i}"
 install -Dm755 ${srcdir}/${i} ${_pkgdir}/${_skybin}/${i}
 ln -rTsf ${_pkgdir}/${_skybin}/${i} ${_pkgdir}/usr/bin/${i}
done
_msg2 'Installing app binaries'
_apps=${srcdir}/apps
_appbinaries=$( ls "${_apps}" )
for i in ${_appbinaries}; do
  _msg3 "${i}"
  install -Dm755 ${_apps}/${i} ${_pkgdir}/${_skyapps}/${i}
  ln -rTsf ${_pkgdir}/${_skyapps}/${i} ${_pkgdir}/usr/bin/${i}
done

_msg2 'Installing scripts'
_scripts1=${srcdir}/${_scripts}/${_pkgname}
_skywirescripts=$( ls ${_scripts1} )
for i in ${_skywirescripts}; do
  _install2 ${_scripts1}/${i} ${_skyscripts}
done

_msg2 'Correcting symlink names'
ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}
#ln -rTsf ${_pkgdir}/${_skybin}/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}-hypervisor

#make sure everything is executable
chmod +x ${_pkgdir}/usr/bin/*

#install dmsghttp-config.json
install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

#install systemd services
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-user.service ${_pkgdir}/${_systemddir}/${_pkgname}-user.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig-remote.service ${_pkgdir}/${_systemddir}/${_pkgname}-autoconfig-remote.service

#desktop integration
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywirevpn.SkywireVPN.desktop ${_pkgdir}/usr/share/applications/com.skywirevpn.SkywireVPN.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywire.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywirevpn.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywirevpn.png

}

_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${pkgdir}/${2}/${_binname}
ln -rTsf ${pkgdir}/${2}/${_binname} ${pkgdir}/usr/bin/${_binname}
#chmod +x ${pkgdir}/usr/bin/${_binname}
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
