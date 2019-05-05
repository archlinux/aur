# Maintainer: Matthias Lisin <ml@visu.li
pkgname=vt-cli
pkgver=0.5.0
pkgrel=2
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('fc37281c78349f0ef6d194c1ace9c36a7fc03a5dfd82d4da1d3176907b432c39c32ccb31d3f5da780fdd46e81a3eb7a6547f4d9385e3c2dc9ad5da6f77be7c52')
_gopkg=gopath/src/github.com/VirusTotal/"$pkgname"

prepare() {
    export GOPATH="$srcdir/gopath"
    mkdir -p "${_gopkg%/*}"
    ln -frs "$pkgname-$pkgver" "$_gopkg"
    cd "$_gopkg"
    dep ensure
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$_gopkg"
    LDFLAGS+=" -X github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}"
    go build -gcflags "all=-trimpath=${GOPATH}" \
             -asmflags "all=-trimpath=${GOPATH}" \
             -ldflags "-extldflags=${LDFLAGS}" \
             -buildmode=pie -o build/vt vt/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/vt "$pkgdir/usr/bin/vt"
}
