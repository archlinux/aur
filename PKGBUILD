# Maintainer: Artur Juraszek <artur@juraszek.xyz>
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>

pkgname=dolt
pkgver=0.26.0
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/archive/v$pkgver.tar.gz")
sha256sums=('2239ceb95403f0c4a0efb63d423636e19ee8c0f7f4ec0d1f5be8e3aeac995292')

prepare() {
    cd $pkgname-$pkgver/go
    mkdir build
}

build() {
    cd $pkgname-$pkgver/go
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/dolt
    go build -o build ./cmd/git-dolt
    go build -o build ./cmd/git-dolt-smudge
}

package() {
    cd $pkgname-$pkgver/go
    install -Dm755 -t $pkgdir/usr/bin/ build/{dolt,git-dolt,git-dolt-smudge}
}
