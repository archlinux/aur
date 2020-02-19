# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
#t.me/Skycoin for inquiries
pkgname=skycoin-bin
pkgname1=skycoin
projectname=skycoin
githuborg=skycoinproject
pkgdesc="Skycoin Cryptocurrency Wallet; Binary Release"
pkgoption1="gui-standalone-linux-x64"
pkgoption2="gui-standalone-linux-arm"
pkgver='0.27.0'
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
url1="https://downloads.${pkgname1}.com/wallet"
license=()
makedepends=(git skycoin-keyring)
provides=(skycoin)
source=("${pkgname1}-scripts.tar.gz"
"${pkgname1}-systemd.tar.gz")
sha256sums=('ca8344614b60e0d9d57b0eba4b44e0febc4addf83a54685539c45e08364b2d23'
'd14d3d597b80a2b79e5edb7e956a7926ca7065230e87fdca026036888835ad42')
#bsdtar -czvf skycoin-scripts.tar.gz skycoin-scripts
#bsdtar -czvf skycoin-systemd.tar.gz skycoin-systemd
#https://downloads.skycoin.com/wallet/skycoin-0.27.0-gui-standalone-linux-x64.tar.gz
sourcefolder_x86_64=()
source_x86_64=("${url1}/${pkgname1}-${pkgver}-gui-standalone-linux-x64.tar.gz"
"${url1}/${pkgname1}-${pkgver}-gui-standalone-linux-x64.tar.gz.asc")
sha256sums_x86_64=('75c14e7379536694f1a1a5a8ebf7abea087b5d3898657e86281073f339c43fcf'
'SKIP')
#https://downloads.skycoin.com/wallet/skycoin-0.27.0-gui-standalone-linux-arm.tar.gz
source_aarch64=("${url1}/${pkgname1}-${pkgver}-gui-standalone-linux-arm.tar.gz"
"${url1}/${pkgname1}-${pkgver}-gui-standalone-linux-arm.tar.gz.asc")
sha256sums_aarch64=('899564f1359b4f7235015dbd3ae59502572515658716a925f59245b815012887'
'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>
prepare() {
	#gpg --import key
	#verify PKGBUILD signature
	gpg --verify ../PKGBUILD.sig ../PKGBUILD
	# https://wiki.archlinux.org/index.php/Go_package_guidelines
}

#build() {
#	mkdir -p ${srcdir}/${pkgname1}-scripts
#	cd ${srcdir}/${pkgname1}-scripts
#}

package() {
	#create directory trees
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname1}/
	#install binary
	install -Dm755 ${srcdir}/${pkgname1}-${pkgver}-*/${pkgname1} ${pkgdir}/usr/lib/${projectname}/go/bin/
	ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${pkgname1} ${pkgdir}/usr/bin/${pkgname1}
	chmod 755 ${pkgdir}/usr/bin/${pkgname1}
	#install the web dir (UI)
	cp -r ${srcdir}/${pkgname1}-${pkgver}-*/src ${pkgdir}/usr/lib/${projectname}/${pkgname1}/
	#install the scripts
	cd ${srcdir}/${pkgname1}-scripts/
	skycoinscripts=$( ls )
	for i in $skycoinscripts; do
		install -Dm755 ${srcdir}/${pkgname1}-scripts/${i} ${pkgdir}/usr/lib/${projectname}/go/bin/${i}
		ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${i} ${pkgdir}/usr/bin/${i}
	done
	#install the system.d service
	cd ${srcdir}/${pkgname1}-systemd/
	skycoinservices=$( ls )
	for i in $skycoinservices; do
	install -Dm644 ${srcdir}/${pkgname1}-scripts/${i} ${pkgdir}/usr/lib/systemd/system/${i}
done
}
