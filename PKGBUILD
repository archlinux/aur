# Maintainer: Peltoche <pierre.peltier@protonmail.com>
pkgname=duckcloud
pkgver=23.10.1
pkgrel=1
epoch=1
pkgdesc="A cloud for your family"
arch=(x86_64)
url=https://duckcloud.co
license=(AGPL3)
depends=()
makedepends=(go)
optdepends=()

source=(https://github.com/theduckcompany/duckcloud/archive/refs/tags/${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.sysusers)

sha256sums=('108ce7c7472adf684dd112b564b783303ba51592127cc8a7a44cc9919f36c595'
            '519d7efe8ecbf6d69dc5ea166aed7d3187c24e7c73f05dd415b49b7b224bd6fc'
            '7fce4fa98f399717e892ed834b886d35f5f543b486502d0ac9b92b1e608f4119')

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
        -ldflags "-linkmode external
                  -X github.com/theduckcompany/duckcloud/pkg/config.Version=${pkgver} \
                  -X github.com/theduckcompany/duckcloud/pkg/config.BuildTime=$(date --utc -Iseconds)" \
        -o ${pkgname} ./cmd/duckcloud
}

package() {
    install -Dm644 ${pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    mkdir -p ${pkgdir}/usr/share/duckcloud
    chown -R duckcloud:duckcloud ${pkgdir}/usr/share/duckcloud
    cd ${pkgname}-${pkgver}
    install -Dm755 ${pkgname} -t "${pkgdir}"/usr/bin/
}
