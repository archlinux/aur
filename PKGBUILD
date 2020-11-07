# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin
_pkgname=${pkgname}
_githuborg=${_pkgname}
pkgdesc="Skycoin Cryptocurrency Wallet. Skycoin.com"
pkgver=0.27.0
#pkgver=0.27.0
pkgrel=3
#pkgrel=3
arch=('any')
license=()
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
makedepends=(go skycoin-keyring)
source=("${url}/archive/v${pkgver}.tar.gz"
"${_pkgname}-scripts.tar.gz"
"${_pkgname}-systemd.tar.gz"
"PKGBUILD.sig")
sha256sums=('2e6c47f058f6f459e6572e6acf3e34403cf14fdc0f2511a4238b7280aae2d026'
            'ca8344614b60e0d9d57b0eba4b44e0febc4addf83a54685539c45e08364b2d23'
            'd14d3d597b80a2b79e5edb7e956a7926ca7065230e87fdca026036888835ad42'
            'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')  # Moses Narrow <moe_narrow@use.startmail.com>
                           #'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>

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
		#verify PKGBUILD signature
		gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
		mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin
		ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath}
	}

build() {
	export GOPATH="${srcdir}"/go
	export GOBIN=${GOPATH}/bin
	_cmddir=${srcdir}/go/src/${_pkggopath}/cmd
  #using go build for determinism
	cd ${_cmddir}/address_gen
	msg2 'building skycoin-address_gen binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${_cmddir}/cipher-testdata
	msg2 'building skycoin-cipher-testdata binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${_cmddir}/monitor-peers
	msg2 'building skycoin-monitor-peers binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${_cmddir}/newcoin
	msg2 'building skycoin-newcoin binary'
	go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${_cmddir}/skycoin-cli
  msg2 'building skycoin-cli binary'
	go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${_cmddir}/skycoin
	msg2 'building skycoin binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
	#binary transparency
	cd $GOBIN
	msg2 'binary sha256sums'
	sha256sum $(ls)
}

package() {
	#create directory trees
	_skysrcdir=${srcdir}/${_pkgname}-${pkgver}
	_skypath=${pkgdir}/opt/${_pkgname}
	_skygobin=${_skypath}/bin
	_skyguidir=${_skypath}/${_pkgname}/src/gui
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${_skygobin}
	mkdir -p ${_skyguidir}
	#install binaries & symlink to /usr/bin
	msg2 'installing binaries'
	_skybin="${srcdir}"/go/bin
	#avoid generic names for binaries
	#collect the binaries & install
	_skybins=$( ls "$_skybin")
	for i in $_skybins; do
		install -Dm755 ${srcdir}/go/bin/${i} ${_skygobin}/${i}
		ln -rTsf ${_skygobin}/$i ${pkgdir}/usr/bin/${i}
		chmod 755 ${pkgdir}/usr/bin/${i}
	done
	#install the web dir (UI)
	cp -r ${_skysrcdir}/src/gui/static ${_skyguidir}
	#install the scripts
	cd ${srcdir}/${_pkgname}-scripts/
	_skycoinscripts=$( ls )
	for i in $_skycoinscripts; do
		install -Dm755 ${srcdir}/${_pkgname}-scripts/${i} ${_skygobin}/${i}
		ln -rTsf ${_skygobin}/${i} ${pkgdir}/usr/bin/${i}
		chmod 755 ${pkgdir}/usr/bin/${i}
	done
	#correct symlink names
	cd ${pkgdir}/usr/bin/
	_namechange=$(ls --ignore='skycoin*')
	for i in $_namechange; do
		mv ${pkgdir}/usr/bin/${i} ${pkgdir}/usr/bin/${_pkgname}-${i}
	done
	#install the system.d service
	cd ${srcdir}/${_pkgname}-systemd/
	_skysystemd=$( ls )
	for i in $_skysystemd; do
	install -Dm644 ${srcdir}/${_pkgname}-systemd/${i} ${pkgdir}/usr/lib/systemd/system/${i}
done
}
