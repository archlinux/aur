# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.0.0'
pkgrel=8
_rc=''
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
#depends=( '' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${_scripts}.tar.gz" )
sha256sums=('1fd23f388562dafcc59b1044572ceb938b3f08cd0e8c397f6b01e8df17366ba5')
sha256sums_x86_64=('bc019915906df4a2be559b9bfc8b870e1a820071f799cd5608070fe242d29a6a')
sha256sums_aarch64=('cf76f6a154a07501baa7208d8a99aa0ea28e5c72f8e37c45f76a1253f878faa4')
sha256sums_armv8=('cf76f6a154a07501baa7208d8a99aa0ea28e5c72f8e37c45f76a1253f878faa4')
sha256sums_armv7=('f76d5e12b34ee67cf758c0df25e619ce28a9ae823497425c2bcca9f34db2c0c6')
sha256sums_arm=('a6b97d0e0bc7f37460edcfe043f16cb28ca9dffb0930d305546e7382ba72259b')
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
source_armv7l=( ${source_armhf[@]} )
source_armv7h=( ${source_armhf[@]} )

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
install -Dm755 ${srcdir}/${_scripts}/${_pkgname}/* ${_pkgdir}/${_skyscripts}/
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
install -Dm644 ${srcdir}/${_scripts}/systemd/* ${_pkgdir}/${_systemddir}/

_msg2 'installing desktop files and icons'
mkdir -p ${_pkgdir}/usr/share/applications/ ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/com.skywirevpn.SkywireVPN.desktop ${_pkgdir}/usr/share/applications/com.skywirevpn.SkywireVPN.desktop
install -Dm644 ${srcdir}/${_scripts}/desktop/skywire.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
install -Dm644 ${srcdir}/${_scripts}/desktop/skywirevpn.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywirevpn.png
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
