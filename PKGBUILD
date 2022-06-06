# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation
_pkgname=Cloak
pkgver=2.6.0
pkgrel=5
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cbeuw/Cloak"
license=('GPL3')
makedepends=('go')
conflicts=('cloak-obfuscation-bin' 'cloak-obfuscation-git')
source=(cloak-obfuscation-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cbb73e87b94ed63603b550ad8e0596865f8547c36f109f0d1e6ca31b9c522571c9f2ac8c2f6caa006a12b3f2126a313c1b2448f57ed9dcf5804f7e2bc8717b60')
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
