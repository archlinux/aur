# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin}
_githuborg=skycoin
pkgdesc="Skywire: Decentralize the web. Skycoin.com"
pkgver='0.6.0'
pkgrel=6
_rc=2
_pkgver=${pkgver}
_tag_ver="v${_pkgver}-rc${_rc}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
makedepends=()
depends=()
provides=( 'skywire' )
conflicts=( 'skywire' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("https://raw.githubusercontent.com/skycoin/skywire/develop/dmsghttp-config.json"
"${_scripts}.tar.gz" )
sha256sums=('42afb6366b877fbfe30905256cf1ec357bcc6a9e8456dfbd4935feb9bd237d1b'
            'cd25c47e5b155ae24a41ca1f4dd822662027b6b8a2b8bbacbaf98f746576950f')
sha256sums_i686=('c51aa91cc7170daa9f4124dcd332f70b616bc4412f7e18645543553301af7a63')
sha256sums_x86_64=('41771efb735a209f70fe72c7039b0b8a2f8f3ea6250f13463d382ec7c5ceca12')
sha256sums_aarch64=('13cddc46b672903340095167618a0983639bba4630d59626ffc37d470ca81b69')
sha256sums_armv8=('13cddc46b672903340095167618a0983639bba4630d59626ffc37d470ca81b69')
sha256sums_armv7=('80e9b1e20d95ffa3683f521750dbec14f934123a151431460f3ab11fd7dda912')
sha256sums_armv7l=('80e9b1e20d95ffa3683f521750dbec14f934123a151431460f3ab11fd7dda912')
sha256sums_armv7h=('80e9b1e20d95ffa3683f521750dbec14f934123a151431460f3ab11fd7dda912')
sha256sums_arm=('80e9b1e20d95ffa3683f521750dbec14f934123a151431460f3ab11fd7dda912')
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
_msg2 'creating dirs'
#create directory trees or the visor might make them with weird permissions
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="usr/lib/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/${_skydir}/bin
mkdir -p ${pkgdir}/${_skydir}/apps
mkdir -p ${pkgdir}/${_skydir}/ssl
mkdir -p ${pkgdir}/${_skydir}/local
mkdir -p ${pkgdir}/${_skydir}/dmsgpty
mkdir -p ${pkgdir}/${_skydir}/${_pkgname}
mkdir -p ${pkgdir}/${_skydir}/transport_logs
mkdir -p ${pkgdir}/${_skydir}/scripts


_msg2 'installing binaries'
_msg3 'skywire-visor'
install -Dm755 ${srcdir}/${_pkgname}-visor ${pkgdir}/${_skybin}/
ln -rTsf ${pkgdir}/${_skybin}/${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}-visor
ln -rTsf ${pkgdir}/${_skybin}/${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}
_msg3 'skywire-cli'
install -Dm755 ${srcdir}/${_pkgname}-cli ${pkgdir}/${_skybin}/
ln -rTsf ${pkgdir}/${_skybin}/${_pkgname}-cli ${pkgdir}/usr/bin/${_pkgname}-cli
_msg2 'installing app binaries'
_msg3 'skychat'
install -Dm755 ${srcdir}/apps/skychat ${pkgdir}/${_skyapps}/
_msg3 'skysocks'
install -Dm755 ${srcdir}/apps/skysocks ${pkgdir}/${_skyapps}/
_msg3 'skysocks-client'
install -Dm755 ${srcdir}/apps/skysocks-client ${pkgdir}/${_skyapps}/
_msg3 'vpn-client'
install -Dm755 ${srcdir}/apps/vpn-client ${pkgdir}/${_skyapps}/
_msg3 'vpn-server'
install -Dm755 ${srcdir}/apps/vpn-server ${pkgdir}/${_skyapps}/
_msg2 'installing scripts'
_skywirescripts=$( ls ${srcdir}/${_scripts}/${_pkgname} )
for i in ${_skywirescripts}; do
  _install2 ${srcdir}/${_scripts}/${_pkgname}/${i} ${_skyscripts}
done

#install dmsghttp-config.json
install -Dm644 ${srcdir}/dmsghttp-config.json ${pkgdir}/${_skydir}/dmsghttp-config.json

#install systemd services
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${pkgdir}/${_systemddir}/${_pkgname}-visor.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig.service ${pkgdir}/${_systemddir}/${_pkgname}-autoconfig.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-autoconfig-remote.service ${pkgdir}/${_systemddir}/${_pkgname}-autoconfig-remote.service

#desktop integration
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywire.Skywire.desktop ${pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywire.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png

#tls key and certificate generation
install -Dm755 ${srcdir}/${_scripts}/ssl/generate.sh ${pkgdir}/${_skydir}/ssl/generate.sh
ln -rTsf ${pkgdir}/${_skydir}/ssl/generate.sh ${pkgdir}/usr/bin/${_pkgname}-tls-gen
install -Dm644 ${srcdir}/${_scripts}/ssl/certificate.cnf ${pkgdir}/${_skydir}/ssl/certificate.cnf
}
_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${pkgdir}/${2}/${_binname}
ln -rTsf ${pkgdir}/${2}/${_binname} ${pkgdir}/usr/bin/${_binname}
chmod +x ${pkgdir}/usr/bin/${_binname}
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
