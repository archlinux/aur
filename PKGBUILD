# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gokrazy-gok-git
pkgver=r302.f7db22d
pkgrel=1
pkgdesc='turn your Go program(s) into an appliance running on the Raspberry Pi 3, Pi 4, Pi 5, Pi Zero 2 W, or amd64 PCs'
arch=('x86_64')
url='https://github.com/gokrazy/tools/'
license=('BSD-3')
depends=('go')
source=("${pkgname}::git+https://github.com/gokrazy/tools/")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/${pkgname}"
    go mod download
    mkdir -p build/
}

build() {
    cd "$srcdir/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/gok
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 build/gok "${pkgdir}/usr/bin/gok"
}
