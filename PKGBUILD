# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire-bin
_pkgname=skywire
_pkgname1=skywire-mainnet
_githuborg=SkycoinProject
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
_pkgver1='0.3.0'
_tag_ver="v${_pkgver1}"
pkgver=${_pkgver1//-/.}
_pkggopath="github.com/${_githuborg}/${_pkgname1}"
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7' 'armv8' 'armv7l' 'armv7h')
url="https://${_pkggopath}"
license=()
makedepends=(git skycoin-keyring)
depends=()
provides=(skywire)
#source=("git+${url}.git#branch=${BRANCH:-develop}"
#install=skywire.install
source=("skywire-scripts.tar.gz"
"PKGBUILD.sig")
#tar -czvf skywire-scripts.tar.gz skywire-scripts
#updpkgsums
sha256sums=('fff8b9f7d4e60c8993497a963161f934d445f4d7cf2ff47bc787dcb459c8b351'
            'SKIP')
sha256sums_x86_64=('dffd28740b051bf07764fa254bf2be15a56dfd6390860541f660aef03fe71856')
sha256sums_aarch64=('ac8cadc15a506f324718cdc9a549ccefa9459e88367441361a6395d330bfcf8b')
sha256sums_armv8=('ac8cadc15a506f324718cdc9a549ccefa9459e88367441361a6395d330bfcf8b')
sha256sums_armv7=('271e6f175ee3382287929ff0eb298712427d64f4cfb930b3b75277a3ace500b2')
sha256sums_armv7l=('271e6f175ee3382287929ff0eb298712427d64f4cfb930b3b75277a3ace500b2')
sha256sums_armv7h=('271e6f175ee3382287929ff0eb298712427d64f4cfb930b3b75277a3ace500b2')
sha256sums_i686=('d74b659aca0e3b90c05cf2b31de9bdbd44f6a4a69a4a0a083f7c44454be3012a')
_release_url=("${url}/releases/download/${_tag_ver}/${_pkgname}-${_tag_ver}")
source_x86_64=("${_release_url}-linux-amd64.tar.gz")
source_aarch64=("${_release_url}-linux-arm64.tar.gz")
source_armv7=("${_release_url}-linux-arm.tar.gz")
source_armv7l=("${_release_url}-linux-arm.tar.gz")
source_armv7h=("${_release_url}-linux-arm.tar.gz")
source_armv8=("${_release_url}-linux-arm64.tar.gz")
source_i686=('')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')  # Moses Narrow <moe_narrow@use.startmail.com>
#'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


prepare() {
	#verify PKGBUILD signature
	gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
	# https://wiki.archlinux.org/index.php/Go_package_guidelines
}

package() {
    msg2 'installing binaries'
  mv ${srcdir}/hypervisor ${srcdir}/${_pkgname}-hypervisor
  install -Dm755 ${_pkgname}-hypervisor ${pkgdir}/usr/bin/${_pkgname}-hypervisor
  install -Dm755 ${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}-visor
  install -Dm755 ${_pkgname}-cli ${pkgdir}/usr/bin/${_pkgname}-cli
  _skywireapps=$( ls ${srcdir}/apps )
  for i in ${_skywireapps}; do
    install -Dm755 ${srcdir}/apps/${i} ${pkgdir}/usr/bin/apps/${i}
  done

  #install scripts
  install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}.sh ${pkgdir}/usr/lib/skycoin/go/bin/${_pkgname}.sh
  ln -rTsf ${pkgdir}/usr/lib/skycoin/go/bin/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-halt.sh ${pkgdir}/usr/lib/skycoin/go/bin/${_pkgname}-halt.sh
  ln -rTsf ${pkgdir}/usr/lib/skycoin/go/bin/${_pkgname}-halt.sh ${pkgdir}/usr/bin/${_pkgname}-halt

#install hypervisorconfig PKGBUILD
  install -Dm644  ${srcdir}/${_pkgname}-scripts/hypervisorconfig.PKGBUILD  ${pkgdir}/usr/lib/${_projectname}/${_pkgname}/hypervisorconfig/PKGBUILD
	cd ${pkgdir}/usr/bin/

  #install the system.d services
  install -Dm644 ${srcdir}/${_pkgname}-scripts/${_pkgname}-hypervisor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-hypervisor.service
  install -Dm644 ${srcdir}/${_pkgname}-scripts/${_pkgname}-visor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-visor.service

	#tls key and certificate generation
	install -Dm755 ${srcdir}/${_pkgname}-scripts/generate.sh ${pkgdir}/usr/lib/skycoin/skywire/ssl/generate.sh
  ln -rTsf ${pkgdir}/usr/lib/skycoin/skywire/ssl/generate.sh ${pkgdir}/usr/bin/skywire-tls-gen
	install -Dm644 ${srcdir}/${_pkgname}-scripts/certificate.cnf ${pkgdir}/usr/lib/skycoin/skywire/ssl/certificate.cnf
}
