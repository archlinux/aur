# Maintainer: Mekyt <hello at mek dot yt>

pkgname='dagu'
pkgver=1.12.9
pkgrel=1
pkgdesc='Cron alternative with a Web UI'
arch=('x86_64')
url='https://github.com/dagu-dev/dagu'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/dagu-dev/dagu/archive/refs/tags/v${pkgver}.tar.gz"
  'dagu.service'
)
b2sums=(
  '2a58d29340fe2e8c684100ac498f3bedd1d1dfbb3d4b69979ec380d5745adb0840c02187fa4de9ada228eed71bbbcd51343a5b71940cb9b2377fe5eae5cc710e'
  '53738a8e513adfb7e608db19686be41003e5ddcbf2cb67260c4e8778f18056d3697f94864be86a1534968b1f228f47c662e0ed7efb670a3a4a6c4ab6324c43df'
)

build() {
    cd "dagu-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    go build
}

package() {
    install -Dm 644 dagu.service -t "${pkgdir}/usr/lib/systemd/system/"

    cd "dagu-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
