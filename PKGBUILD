# Maintainer: AkinoKaede <autmaple@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray
pkgver=1.1.3
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support."
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPLv2')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
makedepends=('go' 'patch')
backup=(etc/xray/config.json)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "config.json"
    "vpoint_socks_vmess.json"
    "vpoint_vmess_freedom.json"
    "xray.service"
    "xray@.service"
    "location_asset.patch"
)
sha512sums=(
    'e69e0f4baae0d90d33e74e5116927171352cf7ddd5fb52f1bdcec6601e87da4dda804d2ef8592fe8ff1236c83c99c0cb46582bf6abac9568aefe7398b0922b87'
    '2000211cbf987adaee7f278cc8cb23268965caab3bc46401f9324f2beaad95bec11012f5f4500f1016f4b75f097f3ac96cc5be2da7a6df0261582b3f23b3d78d'
    '9914fd3da02511b716951e521ca22006a6e8ad66e64d32cc7dd7dc3544a754174b37e35df6108ca217130f02763265d74f8bc56c4e52b262bdd48dcdb5310eb5'
    '532f66fe19196de0cc43df1812d6f32cbca7bbcacaa0cd4141bd80b3121b17eb8b23e0464765cf05a97b11e0213fb688eade83e393e36b3e7ebded6f0925de97'
    '1d31e11c3a11090ee2616adfcf77a4a1013793c8f63a41e5293d07e889e34f85223b9f5a0791b649f22ecc5e18e12182b5b074e61aa36f5cd6de523f3c64f95d'
    '6582aa9bf988acb2660a7172282768c217ad8335a55ccee916d7786c227bc62cc973d7d6d3b5632260c69eec98c15804c2b52cdd91c5f395d3a0fe36519586b4'
    '3fc64f9980fb9d5ceedf6c77fa88abcbf9c3ca15189de7f4e5e319d525591d7049676b8a89e9ef1341ed3ba198041539db4fe37338bab4df9f9b7594f77b36b6'
)

prepare() {
    patch "${srcdir}"/"Xray-core-${pkgver}"/common/platform/others.go "${srcdir}"/location_asset.patch
}

build() {
    cd "${srcdir}"/"Xray-core-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    go build -o xray ./main
}

check() {
    cd "${srcdir}"/"Xray-core-${pkgver}"
    go test -p 1 -tags json -v -timeout 30m github.com/xtls/xray-core/core/...
}

package() {
    cd "${srcdir}"
    install -Dm644 xray.service "${pkgdir}"/usr/lib/systemd/system/xray.service
    install -Dm644 xray@.service "${pkgdir}"/usr/lib/systemd/system/xray@.service
    install -Dm644 *.json -t "${pkgdir}"/etc/xray/

    cd "${srcdir}"/"Xray-core-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/xray/LICENSE
    install -Dm755 xray -t "${pkgdir}"/usr/bin/
}
