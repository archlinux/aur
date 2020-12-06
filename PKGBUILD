# Maintainer: AkinoKaede <autmaple@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=xray-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support."
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPLv2')
depends=('glibc' 'v2ray-domain-list-community' 'v2ray-geoip')
backup=(etc/xray/config.json)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Xray-linux-64.zip"
    "LICENSE::https://raw.githubusercontent.com/XTLS/Xray-core/v${pkgver}/LICENSE"
    "config.json"
    "vpoint_socks_vmess.json"
    "vpoint_vmess_freedom.json"
)
sha512sums=(
    '4f12bb98e1b5f737eb223e92640e60dea76c58830ae24d0504061c2c8c25693cd40b044ef3e1fdff77a50e38d5526ce5cc8f46bfb5a71132181a10d7cd9ef310'
    'c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e'
    '2000211cbf987adaee7f278cc8cb23268965caab3bc46401f9324f2beaad95bec11012f5f4500f1016f4b75f097f3ac96cc5be2da7a6df0261582b3f23b3d78d'
    '9914fd3da02511b716951e521ca22006a6e8ad66e64d32cc7dd7dc3544a754174b37e35df6108ca217130f02763265d74f8bc56c4e52b262bdd48dcdb5310eb5'
    '532f66fe19196de0cc43df1812d6f32cbca7bbcacaa0cd4141bd80b3121b17eb8b23e0464765cf05a97b11e0213fb688eade83e393e36b3e7ebded6f0925de97'
)

prepare() {
    cd "${srcdir}"
    sed -i 's|/usr/local/bin|/usr/bin|;s|/usr/local/etc|/etc|' systemd/system/*.service
    sed -i '/ExecStart/i\Environment=XRAY_LOCATION_ASSET=/usr/share/v2ray' systemd/system/*.service
}


package() {
    cd "${srcdir}"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/xray/LICENSE
    install -Dm644 systemd/system/xray.service "${pkgdir}"/usr/lib/systemd/system/xray.service
    install -Dm644 systemd/system/xray@.service "${pkgdir}"/usr/lib/systemd/system/xray@.service
    install -Dm644 *.json -t "${pkgdir}"/etc/xray/
    install -Dm755 xray -t "${pkgdir}"/usr/bin/
}
