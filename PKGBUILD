# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
_projectname=skycoin
pkgname=skywire-services
_pkgname=${pkgname}
_githuborg="$_projectname"
pkgdesc="Skywire production deployment services. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=1.3.7
pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="ssh://${_pkggopath}"
license=('license-free')
makedepends=('git' 'go' 'musl' 'kernel-headers-musl')
optdepends=('postgresql: store deployment data' 'cockroachdb-bin: store deployment data')
source=("git+${url}.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
#mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin
mkdir -p ${srcdir}/go/bin
#ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
#cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export GOOS=linux
export CGO_ENABLED=1  #default anyways
#use musl-gcc for static compilation
export CC=musl-gcc
#create the binaries
cd ${srcdir}/${_pkgname}
_cmddir=${srcdir}/${_pkgname}/cmd
#temporarily remove because visor-map has nonpublic go deps
rm -rf ${_cmddir}/visor-map
pwd
sed -i 's/SkycoinPro/skycoin/g' go.mod
go mod tidy
go mod vendor
cd ${_cmddir}
for i in * ; do
_msg2 "building ${i} binary"
cd ${_cmddir}/${i}
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
done
#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
}

package() {
_pkgdir=${pkgdir}
#only path differing between debian & archlinux
#_systemddir="usr/lib/systemd/system"
_skydir="opt/${_pkgname}"
_skybin="${_skydir}/bin"
_msg2 'creating dirs'
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
#mkdir -p ${_pkgdir}/${_systemddir}

_msg2 'installing binaries'
 install -Dm755 ${GOBIN}/* ${_pkgdir}/${_skybin}/
for _i in ${_pkgdir}/${_skybin}/* ; do
	ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*/}
done

chmod +x ${_pkgdir}/usr/bin/*

#install systemd services
#_msg2 'Installing systemd services'
#install -Dm644 ${srcdir}/*.service ${_pkgdir}/${_systemddir}/
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
