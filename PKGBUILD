# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation
_pkgname=Cloak
pkgver=2.10.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cbeuw/Cloak"
license=('GPL3')
makedepends=('go')
conflicts=('cloak-obfuscation-bin' 'cloak-obfuscation-git')
source=(cloak-obfuscation-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f78550d448a0085f0354b8d1c086b7a311941b8f842e7175e9ace5e2a28d2adeb29f484255fa4aabf90ac2320e354b1c6873fb682e301a724fe3eafe8bbe9886')
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
