# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=sing-box-cagedbird-bin
_pkgname=sing-box
_pkgver=1.15.0-alpha.13-cagedbird.20261027172802.7a167bdff
pkgver=1.15.0_alpha.13_cagedbird.20261027172802.7a167bdff
epoch=1
pkgrel=1
pkgdesc='The universal proxy platform with native Clash subscription support (cagedbird binary build)'
arch=('x86_64' 'aarch64')
url='https://github.com/cagedbird043/sing-box'
license=('LicenseRef-sing-box')
provides=('sing-box')
conflicts=('sing-box' 'sing-box-bin' 'sing-box-alpha' 'sing-box-beta' 'sing-box-beta-bin' 'sing-box-git')
backup=('etc/sing-box/config.json')
options=('!debug')
optdepends=('sing-geosite-rule-set: GeoSite rule sets'
            'sing-geoip-rule-set: GeoIP rule sets')

_release_tag="v${_pkgver}"
_release_url="${url}/releases/download/${_release_tag}"
_raw_url="${url}/raw/${_release_tag}"
source=("${_pkgname}.service::${_raw_url}/release/config/sing-box.service"
        "${_pkgname}@.service::${_raw_url}/release/config/sing-box@.service"
        "${_pkgname}-split-dns.xml::${_raw_url}/release/config/sing-box-split-dns.xml"
        "${_pkgname}-network-recover::${_raw_url}/release/config/sing-box-network-recover"
        "config.json::${_raw_url}/release/config/config.json")
source_x86_64=("${_pkgname}-cagedbird-linux-amd64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-cagedbird-linux-arm64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-arm64.tar.gz")
sha256sums=('51c05b1c9415a57f1fb3c4d67d9cb2aeee1b7fcd1671747d349988ed371a66fd'
            'c246af05df1d89da50edc8c6de8b077907974fe614ab64bd43151f79ab4e0158'
            'ba33c0c5bfdc5cd68b44c576cd97b33f0bfa0198e66ff8f34f21e706e97fda9e'
            '2a6970a742c8a9b9a582fc65921545d15c45fc342aea45a0d4fc0d1b2952e288'
            '4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde')
sha256sums_x86_64=('9983e3e3a69bbbe025873b48b6423e180a1709f2671ccc51583e1f3acd3c85c8')
sha256sums_aarch64=('236d2f42c6a105b579511bd485453e9ee717002c79cda92c92e3959bd404532a')

package() {
    install -Dm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${_pkgname}-split-dns.xml" "${pkgdir}/usr/share/dbus-1/system.d/${_pkgname}-split-dns.conf"
    install -Dm755 "${_pkgname}-network-recover" "${pkgdir}/usr/lib/NetworkManager/dispatcher.d/90-sing-box-recover"
    install -Dm644 config.json -t "${pkgdir}/etc/${_pkgname}"

    declare -A arch_map=([x86_64]='amd64' [aarch64]='arm64')
    cd "${srcdir}/${_pkgname}-cagedbird-linux-${arch_map[$CARCH]}"

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 <("./${_pkgname}" completion bash) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 <("./${_pkgname}" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <("./${_pkgname}" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
