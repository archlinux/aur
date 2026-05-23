# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation
_pkgname=Cloak
pkgver=2.12.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cbeuw/Cloak"
license=('GPL3')
makedepends=('go')
conflicts=('cloak-obfuscation-bin' 'cloak-obfuscation-git')
source=(cloak-obfuscation-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a8d4457c028a6bd71e30a57399665657a0a491f1da0be3b69f0a608334e7c68fee40d493fa2c4958832e3e29cc9d3b62f803b97121aa568654c7fa79a3ed888f')
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
