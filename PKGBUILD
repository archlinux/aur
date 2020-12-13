# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx
_pkgname=$pkgname
_projectname=skycoin
_githuborg=$_projectname
pkgdesc="CX Blockchain Programming Language. skycoin.com/cx"
pkgver=0.7.1
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkggopath1="github.com/SkycoinProject/${_pkgname}"
pkgrel=4
arch=('any')
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'gcc' 'glade' 'xorg-server-xvfb' 'libxinerama' 'libxcursor' 'libxrandr' 'libglvnd' 'libglade' 'mesa' 'libxi' 'cairo' 'perl' 'pango' 'goyacc' 'musl' 'kernel-headers-musl')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1deb342041cc365c92617e8cf6c24801ff3011f2df90a988b4541b5bc83be4fe')
#validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
#'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>

prepare() {
	#verify PKGBUILD signature
	#gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  mkdir -p ${srcdir}/go/src/${_pkggopath1//${_pkgname}/} ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath1}
  #cd ${srcdir}/go/src/${_pkggopath}/
	}

build() {
  set -x
  export GOPATH=${srcdir}/go
  export GOBIN=${GOPATH}/bin
  export CC=musl-gcc
	#  cp -b Makefile ${srcdir}/go/src/${_pkggopath}/Makefile
  cd ${srcdir}/go/src/${_pkggopath1}
  #make build-full
  #go get -u github.com/SkycoinProject/nex ##added as makedep
 	#go get -u modernc.org/goyacc ##added as makedep
  goyacc -o cxgo/cxgo0/cxgo0.go cxgo/cxgo0/cxgo0.y
	goyacc -o cxgo/parser/cxgo.go cxgo/parser/cxgo.y
  	_cmddir=${srcdir}/go/src/${_pkggopath1}/cmd
  #static compilation
  _msg2 'building cx binary'
  cd ${srcdir}/go/src/${_pkggopath1}/
  go build -tags="base cxfx" -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -i -o $GOBIN/ cxgo/.
	cd ${srcdir}/go/src/${_pkggopath1}/cmd/newcoin
  _msg2 'building cx-newcoin binary'
  go build -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .  #binary transparency
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)
}

package() {
	options=(!strip staticlibs)
	#make dirs
	mkdir -p ${pkgdir}/usr/bin
#	mkdir -p ${pkgdir}/opt/${_projectname}/go/bin
#	mkdir -p ${pkgdir}/opt/${_projectname}/go/src/github.com/${_projectname}/
	mkdir -p ${pkgdir}/opt/${_pkgname}/
	#^MAKE DEPENDANCIES ARE IN GOBIN; GET ONLY CX & NEWCOIN
	install -Dm755 ${srcdir}/go/bin/newcoin ${pkgdir}/opt/${_pkgname}/bin/newcoin
	ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/newcoin ${pkgdir}/usr/bin/newcoin
	chmod 755 ${pkgdir}/usr/bin/newcoin
	install -Dm755 ${srcdir}/go/bin/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
	ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/usr/bin/${_pkgname}
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
