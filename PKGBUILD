# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Philipp Klein <philipptheklein@gmail.com>

pkgname=gdrive2
pkgver=2.1.1
pkgrel=1
pkgdesc='Google Drive CLI Client (version 2)'
arch=(x86_64)
url=https://github.com/prasmussen/gdrive
license=(MIT)
makedepends=(git go)
options=(!strip)
source=("${url}/archive/${pkgver}/${pkgname%2}-${pkgver}.tar.gz")
sha256sums=('9092cb356acf58f2938954784605911e146497a18681199d0c0edc65b833a672')

_gopkg="${url#https://}"
_gobuild=build/src/$_gopkg

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw" # -mod=readonly

prepare() {
    mkdir -p "$(dirname $_gobuild)"
    cp -a "$srcdir/${pkgname%2}-${pkgver}" $_gobuild

    export GOCACHE="$srcdir/cache"
    export GOPATH="$srcdir/build"
    go mod init $_gopkg
    go mod tidy -e
}

build() {
    export GOCACHE="$srcdir/cache"
    export GOPATH="$srcdir/build"
    go install $_gopkg@${pkgver}
}

package() {
    install -Dm755 build/bin/gdrive "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname%2}-${pkgver}/LICENSE
}
