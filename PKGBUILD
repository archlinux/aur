# Maintainer: Moses Narrow <moe_narrow@skycoin.com>
pkgname=skyline-commander-git
_pkgname=${pkgname/-git/}
_githuborg=vit1251
pkgdesc="Golang reimplementation of Midnight Commander"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.0.1
pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=('license-free')
makedepends=('git' 'go' 'pkg-config' 'ncurses')
depends=('ncurses')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
if [[ ${_version} == "" ]] ; then
	_version="0.0.1"
fi
echo ${_version}
}

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin
ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export _GOAPPS=${GOPATH}/apps
export GOOS=linux
#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
_msg2 "building ${_pkgname} binary"
go build -o $GOBIN .
#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
_msg2 'cleaning up'
set -x
sudo rm -rf ${srcdir}/go/pkg/
set +x
}

package() {
_msg2 "installing ${_pkgname} binary"
 install -Dm755 ${GOBIN}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
