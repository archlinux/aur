# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray
pkgver=25.12.8
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support"
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPL-2.0')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
makedepends=('go')
provides=('v2ray')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "xray.sysusers"
        "xray.tmpfiles"
        "xray.service"
        "xray@.service")
sha256sums=('d4519b2d9bb1871f4d7612aa7a8db1c451573b5a44ac824219bb44d63f404e61'
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
    go build -o xray -gcflags="all=-l=4" ./main
}

check() {
    cd "Xray-core-${pkgver}"
    go test -p 1 -tags json -v -timeout 30m github.com/xtls/xray-core/core/...
}

package() {
    cd "Xray-core-${pkgver}"
    install -Dm755 xray -t "${pkgdir}/usr/bin"
    install -d "${pkgdir}/etc/xray" "${pkgdir}/usr/share/xray"
    ln -s /usr/share/v2ray/geo{ip,site}.dat -t "${pkgdir}/usr/share/xray"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/xray.sysusers" "${pkgdir}/usr/lib/sysusers.d/xray.conf"
    install -Dm644 "${srcdir}/xray.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/xray.conf"
    install -Dm644 "${srcdir}/xray.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/xray@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
