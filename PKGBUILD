# Maintainer: Mekyt <hello at mek dot yt>

pkgname='dagu'
pkgver=1.16.4
pkgrel=0
pkgdesc='Cron alternative with a Web UI'
arch=('x86_64')
url='https://github.com/dagu-dev/dagu'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=(
  'go'
  'make'
  'yarn'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/dagu-dev/dagu/archive/refs/tags/v${pkgver}.tar.gz"
  'dagu.service'
)
b2sums=(
  'f612349e6a24afbab243a6152e960d819c062f190bf84d8d5d89e9d4e50bc8a82bbb9168c8f19ce0f23e1126c609e11ba58bbd129ab25ec20f6e34458d23d9ae'
  '53738a8e513adfb7e608db19686be41003e5ddcbf2cb67260c4e8778f18056d3697f94864be86a1534968b1f228f47c662e0ed7efb670a3a4a6c4ab6324c43df'
)

build() {
    cd "dagu-${pkgver}/ui"
    yarn

    cd ".."
    make build-ui
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
    make build-bin
}

package() {
    install -Dm 644 dagu.service -t "${pkgdir}/usr/lib/systemd/system/"

    cd "dagu-${pkgver}"

    install -Dm 755 ".local/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
