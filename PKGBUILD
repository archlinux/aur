# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=sing-box-cagedbird-bin
_pkgname=sing-box
_pkgver=1.15.0-alpha.13-cagedbird.20261125135229.80173bd8c
pkgver=1.15.0_alpha.13_cagedbird.20261125135229.80173bd8c
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
source=("config.json-${_pkgver}::${_raw_url}/release/config/config.json"
        "sing-box.service-${_pkgver}::${_raw_url}/release/config/sing-box.service"
        "sing-box@.service-${_pkgver}::${_raw_url}/release/config/sing-box@.service"
        "sing-box-split-dns.xml-${_pkgver}::${_raw_url}/release/config/sing-box-split-dns.xml")
source_x86_64=("${_pkgname}-cagedbird-linux-amd64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-cagedbird-linux-arm64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-arm64.tar.gz")
sha256sums=('4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde'
            '0cb351b7dfb6cbebaf9f7d615758d242a35e3862b4419ef97107188420504fd6'
            '2bff7f164d93f912d14b60901bd3505d0c38027319790e418b6fd25b6fda28e9'
            'ba33c0c5bfdc5cd68b44c576cd97b33f0bfa0198e66ff8f34f21e706e97fda9e')
sha256sums_x86_64=('9257ab01d5836d7d02ddc2a9a92a7dc2da9dac4d82368f9eee07964b16f3915d')
sha256sums_aarch64=('af357629e064bf6fb11b979dcf6cec4e2ad1619e1fc9f8e3c905c6087f7f4b5d')

package() {
    install -Dm644 "config.json-${_pkgver}" "${pkgdir}/etc/sing-box/config.json"
    install -Dm644 "sing-box.service-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box.service"
    install -Dm644 "sing-box@.service-${_pkgver}" "${pkgdir}/usr/lib/systemd/system/sing-box@.service"
    install -Dm644 "sing-box-split-dns.xml-${_pkgver}" "${pkgdir}/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    declare -A arch_map=([x86_64]='amd64' [aarch64]='arm64')
    cd "${srcdir}/${_pkgname}-cagedbird-linux-${arch_map[$CARCH]}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 <("./${_pkgname}" completion bash) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 <("./${_pkgname}" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <("./${_pkgname}" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
