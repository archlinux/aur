# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=easierconnect
pkgver=TestBuild15.r5.376593e
pkgrel=2
pkgdesc="Sangfor EasyConnect protocol reimplementation in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/lyc8503/EasierConnect"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=(
    'git'
    'go=2:1.19.5'
    'libx11'
    'libxcursor'
    'libxrandr'
    'libxinerama'
    'libxi'
    'libglvnd'
)
_tag="376593ea5517d4ea73c66f668b80b20a17cb09ad"
source=($pkgname::git+$url.git#tag=$_tag)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$pkgname"
    mkdir -p build/
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 build/EasierConnect "$pkgdir/usr/bin/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
