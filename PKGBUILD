# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com"
pkgver='1.0.0'
pkgrel=6
_rc='-rc6'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${_scripts}.tar.gz" )
sha256sums=('214f2335a95880d1a82513b3db2df665391bea3dd34933c78e60be6f9e2576ea')
sha256sums_x86_64=('cd9bd3794b19a8af4ba93ba57f35c3e291689f924d39cf40067e652f8e5d0d03')
sha256sums_aarch64=('035294fa4df15c846ec374145a04997928d837d37bdee23cf771dca04258b4e7')
sha256sums_armv8=('035294fa4df15c846ec374145a04997928d837d37bdee23cf771dca04258b4e7')
sha256sums_armv7=('b43bf38c31c20f70031de6b4f2f764343d5535972a766b857f3e9a3a9fc19661')
sha256sums_armv7l=('b43bf38c31c20f70031de6b4f2f764343d5535972a766b857f3e9a3a9fc19661')
sha256sums_armv7h=('b43bf38c31c20f70031de6b4f2f764343d5535972a766b857f3e9a3a9fc19661')
sha256sums_arm=('b43bf38c31c20f70031de6b4f2f764343d5535972a766b857f3e9a3a9fc19661')
#https://github.com/skycoin/skywire/releases/download/v1.0.0-rc6/skywire-v1.0.0-rc6-linux-amd64.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_arm=("${_release_url}-armhf.tar.gz")
source_armv7=( ${source_arm[@]} )
source_armv7l=( ${source_arm[@]} )
source_armv7h=( ${source_arm[@]} )

## compress scripts archive, update checksums - now in updates.sh
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

_msg2 'installing binaries'
install -Dm755 ${srcdir}/skywire-visor ${_pkgdir}/${_skybin}/
ln -rTsf ${_pkgdir}/${_skybin}/skywire-visor ${_pkgdir}/usr/bin/skywire-visor
install -Dm755 ${srcdir}/skywire-cli ${_pkgdir}/${_skybin}/
ln -rTsf ${_pkgdir}/${_skybin}/skywire-cli ${_pkgdir}/usr/bin/skywire-cli

_msg2 'installing app binaries'
_apps=${srcdir}/apps
install -Dm755 ${_apps}/skychat ${_pkgdir}/${_skyapps}/
ln -rTsf ${_pkgdir}/${_skyapps}/skychat ${_pkgdir}/usr/bin/skychat
install -Dm755 ${_apps}/skysocks ${_pkgdir}/${_skyapps}/
ln -rTsf ${_pkgdir}/${_skyapps}/skysocks ${_pkgdir}/usr/bin/skysocks
install -Dm755 ${_apps}/skysocks-client ${_pkgdir}/${_skyapps}/
ln -rTsf ${_pkgdir}/${_skyapps}/skysocks-client ${_pkgdir}/usr/bin/skysocks-client
install -Dm755 ${_apps}/vpn-client ${_pkgdir}/${_skyapps}/
ln -rTsf ${_pkgdir}/${_skyapps}/vpn-client ${_pkgdir}/usr/bin/vpn-client
install -Dm755 ${_apps}/vpn-server ${_pkgdir}/${_skyapps}/
ln -rTsf ${_pkgdir}/${_skyapps}/vpn-server ${_pkgdir}/usr/bin/vpn-server

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
_msg2 'Installing scripts'
_systemd=${srcdir}/${_scripts}/systemd
_skywiresystemd=$( ls ${_systemd} )
for i in ${_skywiresystemd}; do
install -Dm644 ${srcdir}/${_scripts}/systemd/${i} ${_pkgdir}/${_systemddir}/${i}
done
rm ${_pkgdir}/${_systemddir}/skywire-hypervisor.service

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
