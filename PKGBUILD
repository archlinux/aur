# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
pkgname=rmapi
pkgver=0.0.4
pkgrel=1
pkgdesc="Access reMarkable tablet files through the Cloud API"
arch=('x86_64')
url="https://github.com/juruen/rmapi"
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b3e57462a2158d828f37d5b5f0020d22f60d6212a2d70930ecf8d1593ac05277')

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
