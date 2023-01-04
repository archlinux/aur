 # Maintainer: Moses Narrow <moses@skycoin.com>
pkgname=skywire-dmsg
_pkgname=dmsg
_githuborg=skycoin
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.0.1
pkgrel=2
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'musl' 'kernel-headers-musl') #disable signature check pending fixes#  'skycoin-keyring')
#uncomment the next line and comment the one after for testing your branch
#source=("git+https://github.com/FrappeFortyTwo/dmsg.git#branch=${BRANCH:-enhancement/improve-dmsgpty}")
source=("git+${url}.git#branch=${BRANCH:-develop}")
sha256sums=('SKIP')

pkgver(){
	git describe --always
}

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin ${srcdir}/go/apps
ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export _GOAPPS=${GOPATH}/apps
export GOOS=linux
export CGO_ENABLED=1
#use musl-gcc for static compilation
export CC=musl-gcc

#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
_msg2 "commit hash:"
git rev-parse HEAD
go mod tidy
go mod vendor

_cmddir=${srcdir}/go/src/${_pkggopath}/cmd
for _i in ${_cmddir}/*/*.go ; do
	_dir=${_i/*skycoin\/dmsg\/}
	_dir=${_dir%\/*}
	cd $_dir
	go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
	cd ../../
done
}

package() {
_msg2 'installing binaries'
mkdir -p ${pkgdir}/opt/dmsg/bin/
mkdir -p ${pkgdir}/usr/bin/

for _i in $GOBIN/* ; do
install -Dm755  $_i ${pkgdir}/opt/dmsg/bin/
done
for _i in ${pkgdir}/opt/dmsg/bin/* ; do
ln -rTsf ${_i} ${pkgdir}/usr/bin/${_i##*\/}
done
}


_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
