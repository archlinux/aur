# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
#t.me/Skycoin for inquiries
pkgname=skycoin-bin
pkgname1=skycoin
projectname=skycoin
githuborg=skycoinproject
pkgdesc="Skycoin Cryptocurrency Wallet; Deterministic Build"
pkgoption1="gui-standalone-linux-x64"
pkgoption2="gui-standalone-linux-arm"
pkgver='0.26.0'
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=3
arch=('x86_64')
url="https://${pkggopath}"
license=()
makedepends=(git docker)
provides=(skycoin)
source=("${url}/archive/v${pkgver}.tar.gz"
"https://dl.google.com/go/go1.13.linux-amd64.tar.gz"
'Dockerfile'
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('60f7f2a7c33dbe754ffc74b86de7c2a759e246a83953d4d52fb869d1b3fa1ee2'
'68a2297eb099d1a76097905a2ce334e3155004ec08cdea85f24527be3c48e856'
'SKIP'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')

#detect architecture & adjust source & checksums accordingly
#case "$CARCH" in
#	arm*) _pkgarch="$pkgoption2"
#		sha256sums+=('aa2b0441f8fae3880179b1fac12466c058ded1326abbe9388e9d2141035437d1')
#		;;
#  aarch64*) _pkgarch="$pkgoption2"
#    sha256sums+=('aa2b0441f8fae3880179b1fac12466c058ded1326abbe9388e9d2141035437d1')
#    ;;
#	x86_64) _pkgarch="$pkgoption1"
#		sha256sums+=('e06678954e5d45a3b4bbf3dd7e928a454a70887fccccadb4f21d4652e3a6a2ca')
#		;;
#esac

prepare() {
	gpg --import key
	#verify PKGBUILD signature
	gpg --verify ../PKGBUILD.sig ../PKGBUILD
	# https://wiki.archlinux.org/index.php/Go_package_guidelines
	mkdir -p ${srcdir}/docker
	mv ${srcdir}/${pkgname1}-${pkgver}  ${srcdir}/docker/${pkgname1}-${pkgver}
  mv ${srcdir}/go ${srcdir}/docker/go

	cp -b ../Dockerfile ${srcdir}/Dockerfile
	docker build -t skycoin/wallet:0.26.0 ${srcdir}

	mkdir ${srcdir}/bin
}

build() {
	docker run -it --rm -v ${srcdir}:${srcdir} -w ${srcdir} -e CGO_ENABLED=0 skycoin/wallet:0.26.0 build -o ${srcdir}/bin/skycoin github.com/skycoin/skycoin/cmd/skycoin
	docker run -it --rm -v ${srcdir}:${srcdir} -w ${srcdir} -e CGO_ENABLED=0 skycoin/wallet:0.26.0 build -o ${srcdir}/bin/newcoin github.com/skycoin/skycoin/cmd/newcoin
	docker run -it --rm -v ${srcdir}:${srcdir} -w ${srcdir} -e CGO_ENABLED=0 skycoin/wallet:0.26.0 build -o ${srcdir}/bin/cipher-testdata github.com/skycoin/skycoin/cmd/cipher-testdata
	docker run -it --rm -v ${srcdir}:${srcdir} -w ${srcdir} -e CGO_ENABLED=0 skycoin/wallet:0.26.0 build -o ${srcdir}/bin/monitor-peers github.com/skycoin/skycoin/cmd/monitor-peers

	sha256sum ${srcdir}/bin/* > ${srcdir}/sha256sums.txt

	msg 2 'creating launcher scripts skycoin-wallet & skycoin-wallet-nohup'
	mkdir -p ${srcdir}/${pkgname1}-scripts
	cd ${srcdir}/${pkgname1}-scripts
	#Launch wallet in terminal
	echo -e '#!/bin/bash
	#launch skycoin wallet
	export GOBIN=/usr/lib/skycoin/go/bin
	export GOPATH=GOBIN=/usr/lib/skycoin/go
	skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -log-level=debug' > ${pkgname1}-wallet
	chmod +x ${pkgname1}-wallet
	#launch wallet quietly in the background
	echo -e '#!/bin/bash
	#launch skycoin wallet with nohup
	export GOBIN=/usr/lib/skycoin/go/bin
	export GOPATH=GOBIN=/usr/lib/skycoin/go
	nohup skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static -launch-browser=true -enable-all-api-sets=true -enable-gui=true -log-level=debug > /dev/null 2>&1 &echo "skycoin wallet has started"' > ${pkgname1}-wallet-nohup
	chmod +x ${pkgname1}-wallet-nohup
	#Launch skycoin daemon
	echo -e '#!/bin/bash
	#launch skycoin daemon
	export GOBIN=/usr/lib/skycoin/go/bin
	export GOPATH=GOBIN=/usr/lib/skycoin/go \n skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -enable-gui=false -launch-browser=false -log-level=debug -enable-all-api-sets=true' > ${pkgname1}-node
	chmod +x ${pkgname1}-node
	#stop skycoin
	echo -e '#!/bin/bash
#halt skycoin
sudo killall skycoin
sudo killall cli
sudo killall cipher-testdata
sudo killall newcoin
sudo killall monitor-peers
echo "skycoin halted"' > ${pkgname1}-halt
	chmod +x ${pkgname1}-halt
	#
	msg 2 'creating system.d .service files'
	#these service files point to skywire & skywire-node-miner scripts from above
	#the systemd service files included with skywire are wrong for archlinux (debian formatted)
	cd ${srcdir}/
	echo -e '[Unit]
Description=Skycoin Node service
After=network.target
After=network-online.target
[Service]
Type=oneshot
ExecStart=/usr/bin/skycoin-node
RemainAfterExit=yes
ExecStop=/usr/bin/skycoin-halt
TryExec=/usr/bin/skycoin

[Install]
WantedBy=multi-user.target' > ${pkgname1}-node.service
}

#TO DO
#check() {
#}

package() {
	options=(!strip staticlibs)
	#create directory trees
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname1}/src/gui
	#install binaries & symlink to /usr/bin
	msg2 'installing binaries'
	skybin=${srcdir}/bin
	#avoid generic names for binaries
	#collect the binaries & install
	skybins=$( ls "$skybin")
	for i in ${skybins}; do
		install -Dm755 ${srcdir}/bin/${i} ${pkgdir}/usr/lib/${projectname}/go/bin/${i}
		ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${i} ${pkgdir}/usr/bin/${i}
		chmod 755 ${pkgdir}/usr/bin/${i}
	done
	#install the web dir (UI)
	cp -r ${srcdir}/docker/${pkgname1}-${pkgver}/src/gui/static ${pkgdir}/usr/lib/${projectname}/${pkgname1}/src/gui
	#install the scripts
	skycoinscripts=$( ls ${srcdir}/${pkgname1}-scripts )
	for i in $skycoinscripts; do
		cp ${srcdir}/${pkgname1}-scripts/${i} ${pkgdir}/usr/bin/${i}
	done
	#make symlinks have less generic names
	namechange=$(ls --ignore='skycoin*' ${pkgdir}/usr/bin/)
	for i in ${namechange}; do
		mv ${pkgdir}/usr/bin/${i} ${pkgdir}/usr/bin/${pkgname1}-${i}
	done
	#install the system.d service
	install -Dm644 ${srcdir}/${pkgname1}-node.service ${pkgdir}/usr/lib/systemd/system/${pkgname1}-node.service
}

#previous #source+=("https://downloads.skycoin.net/wallet/${pkgname1}-$pkgver-$_pkgarch.tar.gz")
