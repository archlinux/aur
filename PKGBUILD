# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.0.0'
pkgrel=7
_rc='-rc7'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
depends=( 'net-tools' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${_scripts}.tar.gz" )
sha256sums=('d758615f05d64fcd3f3a55a75916927fc9d1bfa091d492bdbecfab4a6b84742d')
sha256sums_x86_64=('1c9a179095fee2895e12a34efc68c4bc6e5031eb6ee364ff838c0454a07dc427')
sha256sums_aarch64=('93e82f3a6799e68fcbbb7f613ebf1f417fcb41456e98d68649772c7890c076e0')
sha256sums_armv8=('93e82f3a6799e68fcbbb7f613ebf1f417fcb41456e98d68649772c7890c076e0')
sha256sums_armv7=('dc91bb6116fbd99e2260af1479e58296a53707a8e4132a247be7fd66d4407078')
sha256sums_armv7l=('dc91bb6116fbd99e2260af1479e58296a53707a8e4132a247be7fd66d4407078')
sha256sums_armv7h=('dc91bb6116fbd99e2260af1479e58296a53707a8e4132a247be7fd66d4407078')
sha256sums_arm=('dc91bb6116fbd99e2260af1479e58296a53707a8e4132a247be7fd66d4407078')
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

#install systemd services
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
