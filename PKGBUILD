# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
projectname=skycoin
pkgname=skywire
pkgname1=skybian
githuborg=SkycoinProject
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
pkgver=0.2.1
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=4
arch=('x86_64' 'aarch64' 'armv7' 'armv8' 'armv7l' 'armv7h')
url="https://${pkggopath}"
license=()
makedepends=(git go skycoin-keyring)
depends=(networkmanager)
#source=("git+${url}.git#branch=${BRANCH:-develop}"
source=("git+https://github.com/SkycoinProject/skybian.git#branch=${BRANCH:-develop}"
"PKGBUILD.sig")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('988a9925b1650424a97836951b284e633fc78e857b908d65e40cbf6d18eb96d7')
sha256sums_aarch64=('5ee60c5b7ce63999520167ab44b7f3b7a2328ea9ebbbabe043cc5245b50d5a81')
sha256sums_armv7=('6ebadb2b6dbba87a060993560fe957d617f40ca7e467129889d51baebe57fa47')
sha256sums_armv7l=('6ebadb2b6dbba87a060993560fe957d617f40ca7e467129889d51baebe57fa47')
sha256sums_armv7h=('6ebadb2b6dbba87a060993560fe957d617f40ca7e467129889d51baebe57fa47')
sha256sums_armv8=('5ee60c5b7ce63999520167ab44b7f3b7a2328ea9ebbbabe043cc5245b50d5a81')
source_x86_64=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-amd64.tar.gz")
source_aarch64=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-arm64.tar.gz")
source_armv7=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-armv7.tar.gz")
source_armv7l=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-armv7.tar.gz")
source_armv7h=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-armv7.tar.gz")
source_armv8=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-arm64.tar.gz")

validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


export GOOS=linux
export GOPATH="${srcdir}"
export GOROOT="$builddir"
export GOBIN="$GOROOT"/bin
export GOROOT_FINAL=/usr/lib/go

export CGO_ENABLED=1

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
	# https://wiki.archlinux.org/index.php/Go_package_guidelines
}

build() {
	mkdir -p ${srcdir}/go/src/github.com/${githuborg}/ ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${pkgname1} ${srcdir}/go/src/${pkggopath}
  cd ${srcdir}/go/src/${pkggopath}/
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
	cmddir=${srcdir}/go/src/${pkggopath}/cmd
	#using go build for determinism
	cd ${cmddir}/skyconf
	msg2 'building skyconf binary'
	go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
}

package() {
    options=(!strip staticlibs)
  #create directory trees
  mkdir -p ${pkgdir}/usr/bin/apps
  mkdir -p ${pkgdir}/etc/skywire
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/hypervisorconfig/
  #mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/setup-node

  msg2 'installing binaries'
  install -Dm755 ${srcdir}/hypervisor ${pkgdir}/usr/bin/skywire-hypervisor
  install -Dm755 ${srcdir}/skywire-visor ${pkgdir}/usr/bin/skywire-visor
  install -Dm755 ${srcdir}/skywire-cli ${pkgdir}/usr/bin/skywire-cli
  install -Dm755 ${srcdir}/apps/skychat ${pkgdir}/usr/bin/apps/skychat
  install -Dm755 ${srcdir}/apps/skysocks ${pkgdir}/usr/bin/apps/skysocks
  install -Dm755 ${srcdir}/apps/skysocks-client ${pkgdir}/usr/bin/apps/skysocks-client
	install -Dm755 ${srcdir}/skybian/static/skywire-startup ${pkgdir}/usr/bin/skywire-startup
	install -Dm755 ${srcdir}/go/bin/skyconf ${pkgdir}/usr/bin/skyconf

  #install the system.d services
	install -Dm644 ${srcdir}/skybian/static/skywire-startup.service ${pkgdir}/etc/systemd/system/skywire-startup.service
}
