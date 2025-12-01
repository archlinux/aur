# Maintainer: Tomasz <tomasz@example.com>
pkgname=partition-vacuum
pkgver=v0.0.2.r0.g9acaa6f
pkgrel=1
pkgdesc="A daemon to monitor partition free space and delete old files"
arch=('x86_64' 'aarch64')
url="https://github.com/akayami/partition-vacuum"
license=('MIT')
makedepends=('go' 'git')
source=("partition-vacuum::git+https://github.com/akayami/partition-vacuum.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/partition-vacuum"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/partition-vacuum"
    export CGO_ENABLED=1
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
        -o "${pkgname}" .
}

package() {
    cd "${srcdir}/partition-vacuum"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
