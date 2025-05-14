# Maintainer: H3mul <phil.d324@gmail.com>
_pkgname="runpodctl"
pkgname="runpodctl-git"
pkgbase="runpodctl-git"
pkgver=1.14.4.r13.gb508558
pkgrel=1
pkgdesc='CLI tool to automate / manage GPU pods for runpod.io'
arch=('x86_64')
license=('GPL-3.0')
options=(strip docs !debug)
conflicts=($_pkgname)
makedepends=('go' 'git')
url='https://github.com/runpod/runpodctl'
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "$_pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o bin/$_pkgname .
}

check() {
    cd "$_pkgname"
    go test ./...
}

package() {
   cd "$_pkgname"

    # binary
    install -vDm755 -t "$pkgdir/usr/bin" "bin/$_pkgname"

    # license
    install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

    # documentation
    install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
