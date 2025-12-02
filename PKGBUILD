# Maintainer: Tomasz <tomasz@example.com>
pkgname=partition-vacuum
pkgver=v0.0.5.r0.g93453b4
pkgrel=1
pkgdesc="A daemon to monitor partition free space and delete old files"
arch=('x86_64' 'aarch64')
url="https://github.com/akayami/partition-vacuum"
license=('MIT')
makedepends=('go' 'git')
source=("partition-vacuum::git+https://github.com/akayami/partition-vacuum.git"
        "partition-vacuum.service"
        "config.toml")
sha256sums=('SKIP'
            'ecfed78a591df4f4c58b65fa49508688babce2c0f9dc66969d37e8047414d01a'
            'c591203fc5c3ab11c8c269ce5f46b8085b281c8bb3c18a4f5d08668b9cf3907f')

backup=('etc/partition-vacuum/config.toml')

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
    
    cd "${srcdir}"
    install -Dm644 partition-vacuum.service "${pkgdir}/usr/lib/systemd/system/partition-vacuum.service"
    install -Dm644 config.toml "${pkgdir}/etc/partition-vacuum/config.toml"
}
