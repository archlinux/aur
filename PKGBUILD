# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.5.11
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=(x86_64)
url=https://github.com/rusq/slackdump
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/rusq/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz)
b2sums=('38652632ad197daa46da761bccf2c687fbb0c6c7467e3b5097865f0fcbbdba278680ec77c971e2870766de6acae0c6d8d7aac59ec17adcf809cddbd78e80db87')

build() {
    cd $pkgname-${pkgver//_/-}
    mkdir -p build
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd $pkgname-${pkgver//_/-}
    go test ./...
}

package() {
    cd $pkgname-${pkgver//_/-}
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
