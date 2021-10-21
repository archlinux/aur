# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_pkgname=skywire
pkgname=${_pkgname}-bin
_projectname=skycoin
_githuborg=${_projectname}
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
_pkgver='0.5.0'
_tag_ver="v${_pkgver}"
pkgver=${_pkgver//-/.}
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=4
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
makedepends=()
depends=()
provides=( 'skywire' )
conflicts=( 'skywire' )
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${_scripts}.tar.gz" )
# "PKGBUILD.sig")
sha256sums=('e1c3c6634bd754f6f5a9be15f8cf2692c48d45f2029ad6c70740883082ed2e31')
sha256sums_i686=('391d0980e2582e608606f946afc968c0e279836e98c5ddd9e5a2f7846b72b2eb')
sha256sums_x86_64=('382e3db67778ab551d05778b75550b114df0b0bd0c91b41aa8e59ff7473a0895')
sha256sums_aarch64=('98294b08649e76f4e8df4c120cb0a642767cd781b6dee72c9fc72691fab262bb')
sha256sums_armv8=('98294b08649e76f4e8df4c120cb0a642767cd781b6dee72c9fc72691fab262bb')
sha256sums_armv7=('fa7df58d8930e2547341d381283711d068c58ef960a5449427c0babe71257600')
sha256sums_armv7l=('fa7df58d8930e2547341d381283711d068c58ef960a5449427c0babe71257600')
sha256sums_armv7h=('fa7df58d8930e2547341d381283711d068c58ef960a5449427c0babe71257600')
sha256sums_arm=('fa7df58d8930e2547341d381283711d068c58ef960a5449427c0babe71257600')
#            'SKIP')
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-386.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-arm.tar.gz
_release_url=("${url}/releases/download/${_tag_ver}/${_pkgname}-${_tag_ver}-linux")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=( ${source_arm[@]} )
source_armv7l=( ${source_arm[@]} )
source_armv7h=( ${source_arm[@]} )
source_i686=("${_release_url}-386.tar.gz")

#tar -czvf skywire-scripts.tar.gz skywire-scripts
#updpkgsums

package() {
_msg2 'creating dirs'
#create directory trees or the visor might make them with weird permissions
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_systemddir="etc/systemd/system"
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

#rename visor to skywire
[[ -f ${pkgdir}/usr/bin/${_pkgname}-visor ]] && mv ${pkgdir}/usr/bin/${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}

#install the system.d services (from the source)
#install -Dm644 ${srcdir}/go/src/${_pkggopath}/init/${_pkgname}-hypervisor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-hypervisor.service
#install -Dm644 ${srcdir}/go/src/${_pkggopath}/init/${_pkgname}-visor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-visor.service

#install the patched system.d services
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${pkgdir}/${_systemddir}/${_pkgname}-visor.service

#tls key and certificate generation
#install -Dm755 ${srcdir}/${_pkgname}/static/skywire-manager-src/ssl/generate-1.sh ${pkgdir}/${_skydir}/ssl/generate.sh
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
