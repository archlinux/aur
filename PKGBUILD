# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
pkgname=rmapi
pkgver=0.0.5
pkgrel=1
pkgdesc="Access reMarkable tablet files through the Cloud API"
arch=('x86_64')
url="https://github.com/juruen/rmapi"
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('153b72b7f9d5aa60e39577f75fb4ecbef2dbf430990105438d7da9921b7906d5')

_ref="${url#"https://"}"

prepare() {
    export GOPATH="$srcdir"/gopath
    mkdir -p "$GOPATH"

    ref_base="$(dirname "$_ref")"
    mkdir -p "$GOPATH"/src/"$ref_base"
    mv "$pkgname-$pkgver" "$GOPATH"/src/"$_ref"

    cd "$GOPATH"/src/"$_ref"
    go get -v -t -d -a ./...
}

build() {
    export GOPATH="$srcdir"/gopath
    cd "$GOPATH"/src/"$_ref"

    go build \
        -gcflags "all=-trimpath=$GOPATH" \
        -asmflags "all=-trimpath=$GOPATH" \
        -ldflags "-extldflags $LDFLAGS" \
        -v .
}

package() {
    cd "$GOPATH"/src/"$_ref"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
