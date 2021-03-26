# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=yaml2json
pkgver=1.3.r4.g82e774e
pkgrel=1
pkgdesc="Transform yaml string to json string without the type infomation."
url="https://github.com/bronze1man/yaml2json"
license=('MIT')
arch=('x86_64')
makedepends=('go' 'git')
sha256sums=('SKIP')
source=(
    $pkgname::git+https://github.com/bronze1man/yaml2json.git
)

pkgver() {
  cd $pkgname
  git describe --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g;s/^v//"
}

build() {
    mkdir -p ${srcdir}/gobuild
    export GOPATH="${srcdir}/gobuild"
    export GO111MODULE=off

    mv "${srcdir}/${pkgname}/vendor" "$GOPATH/src"

    mkdir -p "$GOPATH/src/github.com/bronze1man"
    cp -r "${srcdir}/${pkgname}" $GOPATH/src/github.com/bronze1man/yaml2json

    cd "$GOPATH/src/github.com/bronze1man/yaml2json"
    #go run github.com/bronze1man/yaml2json/y2jBuilder
    go install -ldflags "-s -w" -gcflags=-trimpath=$GOPATH github.com/bronze1man/yaml2json
}

package() {
    export GOPATH="${srcdir}/gobuild"

    install -Dm755 "$GOPATH/bin/yaml2json" "${pkgdir}/usr/bin/yaml2json"
}

