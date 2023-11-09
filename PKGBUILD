# Maintainer: Josias <aur at macherstube dot ch>
_pkgname=kubo
_plgname=go-ds-s3
_pkgplgname=$_pkgname-s3
pkgname=$_pkgplgname-git
pkgver=0.24.0.r0.ge70db65
pkgrel=1
pkgdesc="IPFS Kubo with S3 Datastore Implementation"
arch=('x86_64')
url="https://github.com/chixodo-xyz/kubo-s3"
license=('GPL3')
groups=()
depends=(glibc)
makedepends=(go git gawk sed which)
provides=("$_pkgplgname" "ipfs")
conflicts=("$_pkgplgname" 'kubo' 'ipfs')
replaces=()
backup=()
options=()
install='prod.install'
source=('git+https://github.com/ipfs/kubo'
				'git+https://github.com/ipfs/go-ds-s3'
				'versions.txt'
				'ipfs.service')
noextract=()
b2sums=('SKIP'
				'SKIP'
				'6b0d5ea366c044d3ab88433a5d4e9613f605fb994c3772b8d2e38c4dc675b7e1fea46819f04f148733f4e67a981701e00bab679613211f6f4906fabad89916e2'
				'e7df78fa46537d2f54a83c8e65ca2aeb30c4b88b4ab52a4da241e22504e80d724ed2eb2a46620616a0a486575a0aeb1d49d016dc4293e1276d61b7d3f7ee2d2e')

prepare() {
	cd "$srcdir/$_pkgname"
	KuboVersion=$(git describe --tags --abbrev=0 --match="v*" --exclude="v*-rc*")
	printf "\033[34;1mPrepare Kubo %s (%s)\n\033[0m" ${KuboVersion} $(git describe --long --tags --abbrev=7 ${KuboVersion} |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
	git config advice.detachedHead false
	git checkout ${KuboVersion} -f

	if [ $? -ne 0 ]; then
		printf "\033[31;1mTag not found.\n\033[0m"
		exit -1
	fi

	GoVersion=$(grep "${KuboVersion} " ../versions.txt | awk '{ print $2 }')
	S3Version=$(grep "${KuboVersion} " ../versions.txt | awk '{ print $3 }')

	if [ -z "$GoVersion" ] || [ "$GoVersion" == "*" ]; then
		ln -sf $(which go) $srcdir/go
	else
		printf "\033[34;1mInstalling go version: %s\n\033[0m" ${GoVersion}

		GOPATH=$(go env GOPATH)
		GOROOT=$(go env GOROOT)
		go install golang.org/dl/${GoVersion}@latest
		ln -sf $GOPATH/bin/$GoVersion $srcdir/go
		$srcdir/go download
		GOVERSIONROOT=$($srcdir/go env GOROOT)
		GOVERSIONPATH=$($srcdir/go env GOPATH)

		cp $GOROOT/go.env $GOVERSIONROOT/go.env

		export GOROOT=$GOVERSIONROOT
		export GOPATH=$GOVERSIONPATH
	fi

	export GO111MODULE=on

	cd "$srcdir/$_plgname"
	if [ -z "$S3Version" ] || [ "$S3Version" == "*" ]; then
		S3Version=$(git describe --tags --abbrev=0 --match="go-ds-s3-plugin/v*")
	fi
	S3VersionHash=$(git rev-list -n 1 ${S3Version})
	printf "\033[34;1mPrepare go-ds-s3 plugin %s (%s)\n\033[0m" ${S3Version} $(git describe --long --tags --abbrev=7 ${S3Version} |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
	git config advice.detachedHead false
	git checkout ${S3Version} -f

	cd "$srcdir/$_pkgname"
	$srcdir/go get github.com/ipfs/go-ds-s3/plugin@${S3VersionHash}
	echo -en "\ns3ds github.com/ipfs/go-ds-s3/plugin 0" >> plugin/loader/preload_list

	printf "Set go version and kubo version\n"
	sed -i "s\GOCC ?= go\GOCC ?= ${srcdir}/go\g" Rules.mk
	sed -Ei "s/const CurrentVersionNumber = \"(.*)\"/const CurrentVersionNumber = \"\1-s3\"/g" version.go
}

pkgver() {
	cd "$srcdir/$_pkgname"
	KuboVersion=$(git describe --tags --abbrev=0 --match="v*" --exclude="v*-rc*")
	git describe --long --tags --abbrev=7 ${KuboVersion} |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	printf "\033[34;1mBuild Kubo\n\033[0m"
	make build
	
	printf "Fetch dependencies\n"
	$srcdir/go mod tidy

	printf "\033[34;1mBuild Kubo with S3 Plugin\n\033[0m"
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
	cd "$srcdir"
	mkdir -p $pkgdir/usr/bin
	cp "${srcdir}/$_pkgname/cmd/ipfs/ipfs" "${pkgdir}/usr/bin/ipfs"
	mkdir -p $pkgdir/usr/lib/systemd/system
	cp "${srcdir}/ipfs.service" "${pkgdir}/usr/lib/systemd/system/ipfs.service"
	printf "\033[36;1mBuild to: $pkgdir/usr/bin/ipfs\n\033[0m"
}
