# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.1.1'
pkgrel=1
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
#depends=( '' )
license=('license-free')
install=skywire.install
source=("skywire-autoconfig"
"com.skywire.Skywire.desktop"
"com.skywirevpn.SkywireVPN.desktop"
"skywirevpn.png"
"skywire.png"
"skywire.service"
"skywire-autoconfig.service"
)
sha256sums=('08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c')
sha256sums_x86_64=('e05344a580807c843b023f4deeed7863105c02b8c865ea3bbcaaa13748108c5d')
sha256sums_aarch64=('948296a66d79cb35fcfd510d3edb53f58433934347660e256dd2f909b90797f2')
sha256sums_armv8=('948296a66d79cb35fcfd510d3edb53f58433934347660e256dd2f909b90797f2')
sha256sums_armv7=('03a16c8562047084a1adcde0603c9006cd53cc4b1b79644d836d68706ce8afbb')
sha256sums_armv7l=('03a16c8562047084a1adcde0603c9006cd53cc4b1b79644d836d68706ce8afbb')
sha256sums_armv7h=('03a16c8562047084a1adcde0603c9006cd53cc4b1b79644d836d68706ce8afbb')
sha256sums_arm=('40444274f1864d123e863e8b18f7ac6d1cccf3b19602068ff902ede4e9ff140f')
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
