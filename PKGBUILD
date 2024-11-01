# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray
pkgver=24.10.31
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support"
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPL-2.0')
depends=('glibc' 'xray-domain-list-community' 'xray-geoip')
makedepends=('go')
provides=('v2ray')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "xray.sysusers"
        "xray.tmpfiles"
        "xray.service"
        "xray@.service")
sha256sums=('b61102ce87c61fa97c001cb08bb3ad794ff7184e2457bc58fe71206e53dcee83'
            '801131bf2eb079750f17d3e703e414eab8494db0d512164cdef3cc68cef308b8'
            '2d301e9f2fae728da55f33a15b2c36e90cdb657deafb5d6ab7d74375ce9fdf38'
            '66a8a3280aa5b3ed41b9855ba3de3f884bd2113b4a965cf097fcb31c3a6066ed'
            '05d16acd6e00989ece245bf0df919accae858555c7165a50ce2b3db9c0c5a725')

build() {
    cd "Xray-core-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
    go build -o xray ./main
}

check() {
    cd "Xray-core-${pkgver}"
    go test -p 1 -tags json -v -timeout 30m github.com/xtls/xray-core/core/...
}

package() {
    cd "Xray-core-${pkgver}"
    install -d "${pkgdir}/etc/xray"
    install -Dm755 xray -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/xray.sysusers" "${pkgdir}/usr/lib/sysusers.d/xray.conf"
    install -Dm644 "${srcdir}/xray.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/xray.conf"
    install -Dm644 "${srcdir}/xray.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/xray@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
