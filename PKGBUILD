# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray
pkgver=26.10.29
pkgrel=1
pkgdesc="Proxy platform with XTLS support"
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
sha512sums=('0985aaddcf730ab7337bb84d61b6918646f1b5b14eef9d4dfeeb956d317abfa985aa0443ee7cb75c039bc2615742138ddff41f04455caae76a042c936fa95015'
            '7758155970f3f042409b50393fe71959d40356afd1cf5cf3e9747c346c76f981918022583942f4f1667293182493ac23d4a5d143d917e17c277bc400622ab847'
            '8d7c38c098ef3dd159df677473f9c1cbec91c0c03fb462239936195a30caf89e2bb922d2a83c6584757c379d828b2ed5737cbb98734c51b13267e4b6c1014b41'
            'e6d9352bdbfd39d7468af62b699567da2af79cd7b5323035d397f1631207580de61dd9c37ac0927eb54a2f3c04d8d6540247c1930e890c5bfa81ff3c70fff601'
            '121ffce08ec1ade8222d19a72d21b1352c9a7e6f9dfc84d3eaf19cd6ade348d07688df83745e17c090f3d77578833a2eed7aec22d1e33eea74979ba4d06b8a13')

build() {
    cd "Xray-core-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
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
