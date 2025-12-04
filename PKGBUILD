# Maintainer: Tomasz <tomasz@example.com>
pkgname=partition-vacuum
pkgver=v0.0.8.r0.gc4f8a0f
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
            '71d1d4ef685f073ff6d8464d2bf800722078a4a7f8d03b607ee37566ef94054e')

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
