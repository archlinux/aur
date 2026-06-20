# Maintainer: insmtr <insmtr@insmtr.cn>

pkgname=sing-usbip
pkgver=dev
pkgrel=1

pkgdesc='Cross-platform usbip implementation in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/SagerNet/sing-usbip/'
license=("LicenseRef-${pkgname}")

makedepends=('go' 'clang' 'lld')
source=("$pkgname::git+https://github.com/SagerNet/sing-usbip.git")
sha256sums=('SKIP')
depends=("glibc")

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    export GOPATH=$srcdir
    go mod download
}

build() {
    cd $pkgname

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS} -fuse-ld=lld"
    export CGO_ENABLED=1
    export CC=clang
    export CXX=clang++

    go build -v -o sing-usbip ./cmd/sing-usbip
}

package() {
    cd $pkgname

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 sing-usbip -t "$pkgdir/usr/bin"
}
