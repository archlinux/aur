# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=teleport-client
pkgver=18.4.0
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPL-3.0-only')
depends=('glibc' 'libfido2')
makedepends=('go>=1.16.0', 'git' 'cargo')
provides=('teleport-client' 'tctl' 'tsh')
conflicts=('teleport' 'teleport-client-bin' 'tctl' 'tsh')
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('52edd0ceaae28a8ed19e2e8a63be98d2c9092ac65b675303547d90abb4e03873')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  export GOPATH="${srcdir}/go"
  go mod download -modcacherw
}

build() {
    cd "${pkgname%-*}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make build/tsh build/tctl

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
}

package() {
    cd "${pkgname%-*}-${pkgver}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
