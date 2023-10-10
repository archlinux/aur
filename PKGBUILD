# Maintainer: Peltoche <pierre.peltier@protonmail.com>
pkgname=duckcloud
pkgver=23.10.2
pkgrel=4
epoch=1
pkgdesc="A cloud for your family"
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://duckcloud.co
license=(AGPL3)
depends=()
makedepends=(go)
optdepends=()

source=(https://github.com/theduckcompany/duckcloud/archive/refs/tags/${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.sysusers
        ${pkgname}.tmpfiles
        LICENSE)

sha256sums=('e92898e491c1ca266c380388293dd21cc538218780516b5d0597590cc7459757'
            '5fc25ddfc97831e04945cced120fb77818a0ae67e96fd7f7ee2c0cc5f6136b32'
            'ca526231ca260be83df4dfb5cc3d7400e82a35e3f164b9799c63be9d4b1bcead'
            'e72c5169f2a66e3f97a7a43e24a93dcc092955db5741a4664ee58bea1c7faca7'
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
