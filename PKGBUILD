# Maintainer: Leonardo Brondani Schenkel <leonardo at schenkel dot net>
pkgname=kobo-dictutil-git
pkgver=v0.3.2.r7.g3e598b7
pkgrel=1
pkgdesc="A collection of tools and libraries to work with Kobo dictionaries"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/pgaskin/dictutil"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url})
sha256sums=('SKIP')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

pkgver() {
    cd dictutil
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd dictutil
    go build -o ./bin/dictgen           ./cmd/dictgen
    go build -o ./bin/dictutil          ./cmd/dictutil
    go build -o ./bin/dictzip-decompile ./examples/dictzip-decompile
}

package() {
    cd dictutil/bin
    for cmd in *; do
        install -Dm 755 ${cmd} "${pkgdir}/usr/bin/${cmd}"
    done
}
