# Maintainer: Matthias Lisin <ml@visu.li
pkgname=vt-cli
pkgver=0.6.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('c3295d396f67133ecf67b1d6feadbc9ad3a6c359cd843bfa1b26fc7607b78e32ca5c1c73a1651c79d55b4f120570270ad339f631c6a6ac3677a044af86710dd7')
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
