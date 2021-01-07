# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-webrtc-git
pkgver=r51.9bf3a28
pkgrel=1
pkgdesc="WebRTC server for the Lightspeed project"
arch=(x86_64)
url="https://github.com/GRVYDEV/Lightspeed-webrtc"
license=("custom:MIT")
depends=("glibc")
optdepends=("lightspeed-ingest: Server to handle the FTL handshake"
            "lightspeed-frontend: Frontend to Project Lightspeed")
makedepends=("go" "git")
provides=("lightspeed-webrtc")
conflicts=("lightspeed-webrtc")
backup=("etc/conf.d/lightspeed-webrtc")
source=("${pkgname}::git+https://github.com/GRVYDEV/Lightspeed-webrtc.git"
        "systemd.service"
        "service.env")
sha512sums=('SKIP'
            'e4ed6c1bfcc4ec81b10d40df4a63a473967c2f24ce9d07a81989f604d9174a6f4f7ebd35729f016936b048fd65d544c3dd538a276fd701101f740a80854a3fae'
            '7bbd272cb47216d46f082cd4730c52a0ffd4c3f68964eede725d160383502b65bf8e13209122ebe3f56d668a596bd328872a230d990902822ec8574ba3c0fe05')


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
