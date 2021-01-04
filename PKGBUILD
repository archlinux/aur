# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-webrtc-git
pkgver=r41.191f2df
pkgrel=1
pkgdesc="WebRTC server for the Lightspeed project"
arch=(x86_64)
url="https://github.com/GRVYDEV/Lightspeed-webrtc"
license=("custom:MIT")
depends=("lightspeed-ingest")
optdepends=("lightspeed-frontend: Frontend to Project Lightspeed")
makedepends=("go" "git")
provides=("lightspeed-webrtc")
conflicts=("lightspeed-webrtc")
source=("${pkgname}::git+https://github.com/GRVYDEV/Lightspeed-webrtc.git"
        "systemd.service"
        "service.env")
sha512sums=('SKIP'
            '9d1da80556bf1e427ef5c601ab0a16f3e293bf23559877f853773387c01e9f90e743c18d04b0b9dfa0a49da1f0472a7d59f217dde4ff62ae561ba215ecdd8a42'
            '3feff4b2ec022da6ab40539b79253bf515ffca478588ea93acd6ca16bd9a6256158e96e10459d81b09454d1ba2b80646c02f6861e55e2def15fae4bbab701cac')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -v ./
}

package() {
    cd "$pkgname"

    install -Dm755 "lightspeed-webrtc" "${pkgdir}/usr/bin/lightspeed-webrtc"

    install -Dm755 "../systemd.service" "${pkgdir}/usr/lib/systemd/system/lightspeed-webrtc.service"
    install -Dm755 "../service.env" "${pkgdir}/etc/conf.d/lightspeed-webrtc"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/lightspeed-webrtc/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
