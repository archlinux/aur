 # Maintainer: Moses Narrow <moses@skycoin.com>
pkgname=skywire-dmsg
_pkgname=dmsg
_githuborg=skycoin
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.0.1
pkgrel=3
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

build() {
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export CC=musl-gcc

cd ${_pkgname}
go mod tidy
go mod vendor
go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o ../bin/ ./cmd/...
cd ..
}

package() {
_msg2 'installing binaries'
mkdir -p ${pkgdir}/opt/dmsg/bin/
mkdir -p ${pkgdir}/usr/bin/

for _i in ./bin/* ; do
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
