# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation
_pkgname=Cloak
pkgver=2.8.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cbeuw/Cloak"
license=('GPL3')
makedepends=('go')
conflicts=('cloak-obfuscation-bin' 'cloak-obfuscation-git')
source=(cloak-obfuscation-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0524f4c64dfc3d1316e4621553b2d326f2b185583291b6aa514269e2091052915673d300921da0ac2cc2d2557e5248e29ffab2ecb8f317fe0537b5aceaad0fe9')
backup=(
    "etc/cloak/ckclient.json"
    "etc/cloak/ckserver.json"
)

prepare() {
    cd "${_pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${_pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export CGO_ENABLED=0
    go build -ldflags "-X main.version=v${pkgver}" -o build ./cmd/...
}

check() {
    cd "${_pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${_pkgname}-${pkgver}"
    pushd build
    install -Dm 755 -t "${pkgdir}/usr/bin" ck-client ck-server
    popd

    pushd example_config
    install -Dm 644 -t "${pkgdir}/etc/cloak" ckclient.json ckserver.json
    popd

    # prevent permission issues during cleanup
    chmod -R u+w "${srcdir}/gopath"
}
