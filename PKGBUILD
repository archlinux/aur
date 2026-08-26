# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=proxyguard
pkgver=2.1.1
pkgrel=1
pkgdesc='Proxy WireGuard UDP connections over HTTP(S)'
arch=('x86_64')
license=('MIT')
url='https://codeberg.org/eduVPN/proxyguard'
source=("$url/archive/v$pkgver.tar.gz")
makedepends=('go')
options=(!lto)
sha256sums=('1c7c08f1c294dd0f5e5725685eea906db36a8b9dcac8a875cbcb5d481b8a0ce5')

prepare() {
    cd "$pkgname"
    go test -v .
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v \
        -o "${pkgname}-server" cmd/proxyguard-server/main.go
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -v \
        -o "${pkgname}-client" cmd/proxyguard-client/main.go
}

package() {
    cd "$pkgname"
    install -Dm755 "${pkgname}-server" "${pkgdir}/usr/bin/${pkgname}-server"
    install -Dm755 "${pkgname}-client" "${pkgdir}/usr/bin/${pkgname}-client"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGES.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.md"

    install -Dm644 systemd/proxyguard-server.service \
        "${pkgdir}/usr/lib/systemd/system/proxyguard-server.service"
    install -Dm644 systemd/proxyguard-client.service \
        "${pkgdir}/usr/lib/systemd/system/proxyguard-client.service"
}
