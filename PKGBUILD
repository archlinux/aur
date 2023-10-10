# Maintainer: Peltoche <pierre.peltier@protonmail.com>
pkgname=duckcloud
pkgver=23.10.2
pkgrel=5
epoch=1
pkgdesc="A cloud for your family"
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://duckcloud.co
license=(AGPL3)
depends=(glibc)
makedepends=(go)
optdepends=()

source=(https://github.com/theduckcompany/duckcloud/archive/refs/tags/${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.sysusers
        ${pkgname}.tmpfiles
        LICENSE)

sha256sums=('e92898e491c1ca266c380388293dd21cc538218780516b5d0597590cc7459757'
            'c8284658d295ba32b118784532da5ce2cc7c4ac167a26181d0685683dedb3623'
            'ca526231ca260be83df4dfb5cc3d7400e82a35e3f164b9799c63be9d4b1bcead'
            '5b3e34975e2bfa4a2c55e5a12fc970d103d8635512579dc2ac533b4787d66f9f'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

prepare() {
    cd ${pkgname}-${pkgver}
    go mod vendor
}

build() {
    cd ${pkgname}-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -v \
        -ldflags "-linkmode external \
                  -X github.com/theduckcompany/duckcloud/internal/tools/buildinfosj.Version=${pkgver} \
                  -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.BuildTime=$(date --utc -Iseconds)" \
        -o ${pkgname} ./cmd/duckcloud
}

package() {
    install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
