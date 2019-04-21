# Maintainer: Matthias Lisin <ml@visu.li
pkgname=vt-cli
pkgver=0.5.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('any')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
makedepends=('go' 'dep')
provides=('vt-cli')
conflicts=('vt-cli-bin' 'vt-cli-git')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('fc37281c78349f0ef6d194c1ace9c36a7fc03a5dfd82d4da1d3176907b432c39c32ccb31d3f5da780fdd46e81a3eb7a6547f4d9385e3c2dc9ad5da6f77be7c52')
_gopkg=gopath/src/github.com/VirusTotal/"$pkgname"

prepare() {
    export GOPATH="$srcdir"/gopath
    mkdir -p gopath/src/github.com/VirusTotal
    ln -rTsf "$pkgname-$pkgver" "$_gopkg"
    cd "$_gopkg"
    dep ensure
}

build() {
	export GOPATH="$srcdir"/gopath
    LDFLAGS+=" -X=github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}"
    cd gopath/src/github.com/VirusTotal/"$pkgname"
    go build -gcflags "all=-trimpath=${PWD}" \
             -asmflags "all=-trimpath=${PWD}" \
             -ldflags "-extldflags=${LDFLAGS}" \
             -o build/vt vt/main.go

}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/vt "$pkgdir/usr/bin/vt"
}
