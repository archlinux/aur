# Maintainer: Peltoche <pierre.peltier@protonmail.com>
pkgname=duckcloud
pkgver=23.10.2
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

sha256sums=('e92898e491c1ca266c380388293dd21cc538218780516b5d0597590cc7459757'
            '5fc25ddfc97831e04945cced120fb77818a0ae67e96fd7f7ee2c0cc5f6136b32'
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
        -ldflags "-linkmode external \
                  -X github.com/theduckcompany/duckcloud/internal/tools/buildinfosj.Version=${pkgver} \
                  -X github.com/theduckcompany/duckcloud/internal/tools/buildinfos.BuildTime=$(date --utc -Iseconds)" \
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
