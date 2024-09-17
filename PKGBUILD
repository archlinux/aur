# Maintainer: Harry Youd <harry at youd dot family>
pkgname=guide2go
pkgver=1.2.0
pkgrel=1
pkgdesc="Converts SD-JSON to XMLTV"
arch=('x86_64')
url="https://github.com/mar-mei/${pkgname}"
license=('MIT')
makedepends=("go")
backup=("etc/guide2go.yaml")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.timer"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('a3f15e17220c98cb66e5b9de5e1eb1c3aef1bac2d1fa829c089f40df4601f081'
            'e63e2d2ba70a656abdb932c77024c80dde00e79cd446ae08a0882f23c213af75'
            'eed03fd10dce69af1d9d1675d7876456b6dc9dc0ee903b6f41de37633dfdadc4'
            '362fc91c042c86a734b9183867a0db38b23618c79db95faa8483ffa5c0f3aab3'
            '6df7613f118cc18174a13ae010a49a564b71799b1aa0c84452cef87a34fa3c14')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -o ${pkgname}
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.timer"        "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd ${pkgname}-${pkgver}
    install -Dm644 "sample-config.yaml"      "${pkgdir}/etc/guide2go.yaml"
    install -Dm755 "${pkgname}"        "${pkgdir}/usr/bin/${pkgname}"
}
