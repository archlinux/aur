# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin
pkgname1=skycoin
projectname=skycoin
githuborg=SkycoinProject
pkgdesc="Skycoin Cryptocurrency Wallet ; latest versioned release (compiled from source)"
pkgver=0.27.0
#pkgver=0.27.0
pkgrel=2
#pkgrel=2
arch=('any')
license=()
pkggopath="github.com/${githuborg}/${pkgname1}"
url="https://${pkggopath}"
makedepends=(go skycoin-keyring)
source=("${url}/archive/v${pkgver}.tar.gz"
"${pkgname1}-scripts.tar.gz"
"${pkgname1}-systemd.tar.gz"
"PKGBUILD.sig")
sha256sums=('2e6c47f058f6f459e6572e6acf3e34403cf14fdc0f2511a4238b7280aae2d026'
            'ca8344614b60e0d9d57b0eba4b44e0febc4addf83a54685539c45e08364b2d23'
            'd14d3d597b80a2b79e5edb7e956a7926ca7065230e87fdca026036888835ad42'
            'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


case "$CARCH" in
x86)      export GOARCH="386" GO386="387" ;;
x86_64)   export GOARCH="amd64" ;;
arm*)     export GOARCH="arm" ;;
armel)    export GOARCH="arm" GOARM="5" ;;
armhf)    export GOARCH="arm" GOARM="6" ;;
armv7)    export GOARCH="arm" GOARM="7" ;;
armv8)    export GOARCH="arm64" ;;
aarch64)  export GOARCH="arm64" ;;
mips)     export GOARCH="mips" ;;
mips64)   export GOARCH="mips64" ;;
mips64el) export GOARCH="mips64le" ;;
mipsel)   export GOARCH="mipsle" ;;
*)        return 1 ;;
	esac

	prepare() {
		#gpg --import key
		#verify PKGBUILD signature
		gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
		# https://wiki.archlinux.org/index.php/Go_package_guidelines
		mkdir -p ${srcdir}/go/src/github.com/${githuborg}/ ${srcdir}/go/bin
		#	ln -rTsf ${srcdir}/${pkgname1} ${srcdir}/go/src/${pkggopath}
		ln -rTsf ${srcdir}/${pkgname1}-${pkgver} ${srcdir}/go/src/${pkggopath}
		#cd ${srcdir}/go/src/github.com/${githuborg}/${pkgname1}
		#git submodule --quiet update --init --recursive
		#export GOPATH="${srcdir}"/go
		#export GOBIN=${GOPATH}/bin
		#export PATH=${GOPATH}/bin:${PATH}
		#msg2 'installing go dependencies'
		#dep init
		#dep ensure
	}

build() {
	export GOPATH="${srcdir}"/go
	export GOBIN=${GOPATH}/bin
	export PATH=${GOPATH}/bin:${PATH}
	cmddir=${srcdir}/go/src/${pkggopath}/cmd
  #using go build for determinism
	cd ${cmddir}/address_gen
	msg2 'building skycoin-address_gen binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/cipher-testdata
	msg2 'building skycoin-cipher-testdata binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/monitor-peers
	msg2 'building skycoin-monitor-peers binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/newcoin
	msg2 'building skycoin-newcoin binary'
	go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/skycoin-cli
  msg2 'building skycoin-cli binary'
	go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/skycoin
	msg2 'building skycoin binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
	#binary transparency
	cd $GOBIN
	msg2 'binary sha256sums'
	sha256sum $(ls)
}

package() {
	options=(!strip staticlibs)
	#create directory trees
	skysrcdir=${srcdir}/${pkgname1}-${pkgver}
	skypath=${pkgdir}/usr/lib/${projectname}
	skygobin=${skypath}/go/bin
	skyguidir=${skypath}/${pkgname1}/src/gui
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${skygobin}
	mkdir -p ${skyguidir}
	#install binaries & symlink to /usr/bin
	msg2 'installing binaries'
	skybin="${srcdir}"/go/bin
	#avoid generic names for binaries
	#collect the binaries & install
	skybins=$( ls "$skybin")
	for i in $skybins; do
		install -Dm755 ${srcdir}/go/bin/${i} ${skygobin}/${i}
		ln -rTsf ${skygobin}/$i ${pkgdir}/usr/bin/${i}
		chmod 755 ${pkgdir}/usr/bin/${i}
	done
	#install the web dir (UI)
	cp -r ${skysrcdir}/src/gui/static ${skyguidir}
	#install the scripts
	cd ${srcdir}/${pkgname1}-scripts/
	skycoinscripts=$( ls )
	for i in $skycoinscripts; do
		install -Dm755 ${srcdir}/${pkgname1}-scripts/${i} ${skygobin}/${i}
		ln -rTsf ${skygobin}/${i} ${pkgdir}/usr/bin/${i}
		chmod 755 ${pkgdir}/usr/bin/${i}
	done
	#correct symlink names
	cd ${pkgdir}/usr/bin/
	namechange=$(ls --ignore='skycoin*')
	for i in $namechange; do
		mv ${pkgdir}/usr/bin/${i} ${pkgdir}/usr/bin/${pkgname1}-${i}
	done
	#install the system.d service
	cd ${srcdir}/${pkgname1}-systemd/
	skysystemd=$( ls )
	for i in $skysystemd; do
	install -Dm644 ${srcdir}/${pkgname1}-systemd/${i} ${pkgdir}/usr/lib/systemd/system/${i}
done
}
