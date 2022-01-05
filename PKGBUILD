# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx
_pkgname=$pkgname
_projectname=skycoin
_githuborg=$_projectname
pkgdesc="CX Blockchain Programming Language. skycoin.com/cx"
pkgver=0.8.0
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=2
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'gcc' 'glade' 'xorg-server-xvfb' 'libxinerama' 'libxcursor' 'libxrandr' 'libglvnd' 'libglade' 'mesa' 'libxi' 'cairo' 'perl' 'pango' 'goyacc' 'musl' 'kernel-headers-musl')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e7f56b9439accbec8ab4d314548c84e529086bf0f06e132a7ebee296e8fd2bcc')


prepare() {
	#verify PKGBUILD signature
	#gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  mkdir -p ${srcdir}/go/src/${_pkggopath//${_pkgname}/} ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath}
  #cd ${srcdir}/go/src/${_pkggopath}/
	}

build() {
    export GOPATH=${srcdir}/go
  export GOBIN=${GOPATH}/bin
  export CC=musl-gcc
	#  cp -b Makefile ${srcdir}/go/src/${_pkggopath}/Makefile
  cd ${srcdir}/go/src/${_pkggopath}
	_cmddir=${srcdir}/go/src/${_pkggopath}/cmd
  #static compilation
  _msg2 'building cx binary'
  #make build
  cd ${srcdir}/go/src/${_pkggopath}/cmd/cx
  go build -tags="ptr32 cipher cxfx cxos http regexp" -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)
}

package() {
	options=(!strip staticlibs)
	#make dirs
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/opt/${_pkgname}/
	install -Dm755 ${srcdir}/go/bin/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
	ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/usr/bin/${_pkgname}
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
