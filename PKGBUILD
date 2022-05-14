# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin}
_pkgname1=${pkgname/-bin/-systray}
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
sha256sums=('128d688c945e161180aa0d87a34fc655e627a315dd19308f6f3a05c0457f90e4')
sha256sums_i686=('ed94d9b60188ab5a535c5e2b0c2cba28b8274f15ea081fcf99856aa2ae7dc927')
sha256sums_x86_64=('284e12906c8656a603477c7a13c51a5266fe289fce3bed61206d88a59de1169c')
sha256sums_aarch64=('12d0c6a72af7c8ec951117982b2ea22dc6d5fc29f1aba174bc8cac3d329a5082')
sha256sums_armv8=('12d0c6a72af7c8ec951117982b2ea22dc6d5fc29f1aba174bc8cac3d329a5082')
sha256sums_armv7=('eb4a85c6eb6ac1280d4a8c4ddb36a2a2f049b807cdbc415acb945d48824e5508')
sha256sums_armv7l=('eb4a85c6eb6ac1280d4a8c4ddb36a2a2f049b807cdbc415acb945d48824e5508')
sha256sums_armv7h=('eb4a85c6eb6ac1280d4a8c4ddb36a2a2f049b807cdbc415acb945d48824e5508')
sha256sums_arm=('eb4a85c6eb6ac1280d4a8c4ddb36a2a2f049b807cdbc415acb945d48824e5508')
#https://github.com/skycoin/skywire/releases/download/v0.6.0-rc1/skywire-v0.6.0-rc1-linux-amd64.tar.gz
_binarchive=("${_pkgname1}-${_tag_ver}-linux")
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
