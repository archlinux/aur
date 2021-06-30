# Maintainer: unknowndev <unknowndevQwQ@protonmail.com>

pkgname=v2ray-exporter
pkgver=0.5.1
pkgrel=1
pkgdesc="An exporter that collect V2Ray metrics over its Stats API and export them to Prometheus"
arch=('x86_64')
url="https://github.com/wi1dcard/v2ray-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('v2ray: provide v2ray status')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c3c0cd348713e0a1fbfd65c85bfed93b62bd57eafacfe782f12222e4577339a1f3ffab5670316b46084aab410e6a69c4cc8bc20873e1daccf1a6ceb9761a21c8')



build() {
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GO111MODULE=on
    export CGO_ENABLED=0 # build full static binary
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
        -ldflags "-X main.buildCommit=$(git rev-parse --short HEAD)_at_aur \
                  -X main.buildDate=$(date -u +"%Y-%m-%d_%T_%Z") \
                  -X main.buildVersion=${pkgver}" \
        -o v2ray-exporter ./...

}

package() {
    cd "${pkgname}-${pkgver}"
#    sed -i '7 s/#Type=exec/Type=exec/'              "v2ray-exporter.service"
#    sed -i '8 s/Type=simple/#Type=simple/'          "v2ray-exporter.service"
#    install -Dm644 "v2ray-exporter.service" -t      "$pkgdir/usr/lib/systemd/system"
#    install -Dm644 "v2ray-exporter@.service" -t     "$pkgdir/usr/lib/systemd/system"
    install -Dm755 "LICENSE" -t                     "${pkgdir}/usr/share/licenses/v2ray-exporter"
    install -Dm755 "v2ray-exporter" -t              "${pkgdir}/usr/bin"
}
