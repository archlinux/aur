# Maintainer: Matthias Lisin <ml@visu.li
pkgname=vt-cli
pkgver=0.6.1
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2e1a986e6e52afc0d34c8966ad29e3fca5e66b4a87dd2bed1a03c877694bccba26b44b2831d639248421f6eb0b45b72497f2caefcfcdad73da955e5d4f977b78')
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
