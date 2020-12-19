# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
#t.me/Skycoin for inquiries
_pkgname=skycoin
pkgname=${_pkgname}-bin
_projectname=${_pkgname}
_githuborg=${_projectname}
pkgdesc="Skycoin Cryptocurrency Wallet; Binary Release"
pkgver='0.27.1'
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h' 'arm' 'armv6h' 'armhf' 'armel' )
url="https://${_pkggopath}"
_url="https://downloads.${_projectname}.com/wallet"
license=()
makedepends=()
provides=( 'skycoin' )
conflicts=( 'skycoin' )
#bsdtar -czvf skycoin-scripts.tar.gz skycoin-scripts
source=("${_pkgname}-scripts.tar.gz"
) #"PKGBUILD.sig")
sha256sums=('0738ce23beafc315cad3971afb9b210b0749df05e064db169aea618b5bbd5555')
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-x64.tar.gz
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-arm.tar.gz
_release_url=("${_url}/${_pkgname}-${pkgver}-gui-standalone-linux")
source_x86_64=("${_release_url}-x64.tar.gz")
# "${_release_url}-x64.tar.gz.asc")
source_aarch64=("${_release_url}-arm.tar.gz")
# "${_release_url}-arm.tar.gz.asc")
source_armv7=( ${source_aarch64[@]} )
source_armv7l=( ${source_aarch64[@]} )
source_armv7h=( ${source_aarch64[@]} )
source_armv8=( ${source_aarch64[@]} )
sha256sums_x86_64=('ba4c2354b091b3db0ac7418caab1d52988b6fd1d18a9f0d5e0ebcb3f4ef15f94')
# 'ba4c2354b091b3db0ac7418caab1d52988b6fd1d18a9f0d5e0ebcb3f4ef15f94')
sha256sums_aarch64=('e4bbbde43a4971d21aefec55d4fbe3173694567bc372718ce4dd7352ca0bc169')
# 'e4bbbde43a4971d21aefec55d4fbe3173694567bc372718ce4dd7352ca0bc169'
sha256sums_armv8=( ${sha256sums_aarch64[@]} )
sha256sums_armv7=( ${sha256sums_aarch64[@]} )
sha256sums_armv7l=( ${sha256sums_aarch64[@]} )
sha256sums_armv7h=( ${sha256sums_aarch64[@]} )
sha256sums_armhf=( ${sha256sums_aarch64[@]} )
sha256sums_armel=( ${sha256sums_aarch64[@]} )
#validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
#                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>

#prepare() {
#verify PKGBUILD signature
#gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
# https://wiki.archlinux.org/index.php/Go_package_guidelines
#}

package() {
_msg2 'creating dirs'
#create directory trees
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/opt/${_pkgname}/bin

_msg2 'installing binaries'
#install binary
if [[ $CARCH == 'x86_64' ]] ; then
install -Dm755 ${_pkgname}-${pkgver}-gui-standalone-linux-x64/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
else
install -Dm755 ${_pkgname}-${pkgver}-gui-standalone-linux-arm/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
fi
ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
chmod 755 ${pkgdir}/usr/bin/${_pkgname}

_msg2 'installing gui sources'
#install the web dir (UI)
cp -r ${srcdir}/${_pkgname}-${pkgver}-*/src ${pkgdir}/opt/${_pkgname}/

_msg2 'installing scripts'
#install the scripts
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-wallet ${pkgdir}/usr/bin/${_pkgname}-wallet
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-wallet-nohup ${pkgdir}/usr/bin/${_pkgname}-wallet-nohup

_msg2 'installing systemd services'
#install the system.d service
install -Dm644 ${srcdir}/${_pkgname}-scripts/${_pkgname}-node.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-node.service
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
