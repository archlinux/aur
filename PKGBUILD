# Maintainer: Josias <aur at macherstube dot ch>
_pkgname=kubo
_pkgplgname=$_pkgname-s3
pkgname=$_pkgplgname-git
pkgver=0.22.0.r0.g3f884d3
pkgrel=1
pkgdesc="IPFS Kubo with S3 Datastore Implementation"
arch=('x86_64')
url="https://github.com/chixodo-xyz/kubo-s3"
license=('GPL3')
groups=()
depends=(glibc)
makedepends=(go git)
provides=("$_pkgplgname" "ipfs")
conflicts=("$_pkgplgname" 'kubo' 'ipfs')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/ipfs/kubo.git'
				'git+https://github.com/ipfs/go-ds-s3'
				'versions.txt')
noextract=()
b2sums=('SKIP'
				'SKIP'
				'ba0b7a7ca53a069a58ec6f9dbab98f10120a5ffd2f8ce83fabf21ae8749e29151879d3245a8cf7e6380119c19a57114f7c4696dcaf93c3b712ad3c2eb1c78058')

prepare() {
	cd "$srcdir/$_pkgname"
	KuboVersion=$(git describe --tags --abbrev=0)
	printf "\033[34;1mPrepare Kubo %s (%s)\n\033[0m" ${KuboVersion} $(git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
	git config advice.detachedHead false
	git checkout ${KuboVersion} -f

	if [ $? -ne 0 ]; then
		printf "\033[31;1mTag not found.\n\033[0m"
		exit -1
	fi

	GoVersion=$(grep "${KuboVersion} " ../versions.txt | awk '{ print $2 }')

	if [ -z "$GoVersion" ]; then
		govers=$(which go)
	else
		printf "\033[34;1mInstalling go version: %s\n\033[0m" ${GoVersion}

		GOPATH=$(go env GOPATH)
		GOROOT=$(go env GOROOT)
		go install golang.org/dl/${GoVersion}@latest
		govers=$GOPATH/bin/$GoVersion
		$govers download
		GOVERSIONROOT=$($govers env GOROOT)
		GOVERSIONPATH=$($govers env GOPATH)

		cp $GOROOT/go.env $GOVERSIONROOT/go.env

		export GOROOT=$GOVERSIONROOT
		export GOPATH=$GOVERSIONPATH
	fi


	export GO111MODULE=on

	printf "\033[34;1mFetching go-ds-s3 plugin\n\033[0m"
	$govers get github.com/ipfs/go-ds-s3/plugin@latest
	echo -en "\ns3ds github.com/ipfs/go-ds-s3/plugin 0" >> plugin/loader/preload_list

	sed -i "s\GOCC ?= go\GOCC ?= ${govers}\g" Rules.mk
	sed -Ei "s/const CurrentVersionNumber = \"(.*)\"/const CurrentVersionNumber = \"\1-s3\"/g" version.go
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	printf "\033[34;1mBuild Kubo with S3 Plugin\n\033[0m"
	make build
	$govers mod tidy
	make build

	if [ $? -ne 0 ]; then
		printf "\033[31;1mBuild failed.\n\033[0m"
		exit -1
	fi
}

check() {
	cd "$srcdir/$_pkgname"
	printf "\033[0;35mIPFS Version: $(cmd/ipfs/ipfs version)\n\033[0m"

	if [ $? -ne 0 ]; then
		printf "\033[31;1mCheck failed.\n\033[0m"
		exit -1
	fi
}

package() {
	cd "$srcdir/$_pkgname"
	mkdir -p $pkgdir/usr/bin
	cp cmd/ipfs/ipfs $pkgdir/usr/bin/ipfs
	printf "\033[36;1mBuild to: $pkgdir/usr/bin/ipfs\n\033[0m"
}
