# Maintainer: cagedbird043 <cagedbird043@gmail.com>

pkgname=sing-box-cagedbird-bin
_pkgname=sing-box
_pkgver=1.14.0-alpha.32-cagedbird.0aeabe3c
pkgver=1.14.0_alpha.32_cagedbird.r2465.g0aeabe3c
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
        "${_pkgname}.sysusers::${_raw_url}/release/config/sing-box.sysusers"
        "${_pkgname}.rules::${_raw_url}/release/config/sing-box.rules"
        "${_pkgname}-split-dns.xml::${_raw_url}/release/config/sing-box-split-dns.xml"
        "config.json::${_raw_url}/release/config/config.json")
source_x86_64=("${_pkgname}-cagedbird-linux-amd64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-cagedbird-linux-arm64-${_pkgver}.tar.gz::${_release_url}/${_pkgname}-cagedbird-linux-arm64.tar.gz")
sha256sums=('259fa4ee0a29fb863bd1597eba9392bd9767c679c1e28b8b1ee91ce1ea01c84d'
            '0b8740010bb3b2a5b65f1cc444b00127372d015f70f272ed566606949ed2b91b'
            '0d0631619b6f680b9a80b9a8f65c7a30f2565e80279182f63c77854051c5d473'
            '5a1135cd779a948882702e62b349c19cb72ef56c4af6567bc8f1794ca3b9fbcd'
            'ebdab3b912603c44b4d76640c5db5c4bc0ca04213d7f34ccaa5e789ba40b426f'
            '4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde')
sha256sums_x86_64=('b82a64b252bb675c080c80866c36b0f32a6f4044b1807d4f0ebf8c9882564ed0')
sha256sums_aarch64=('48163c971e0da6f957f55e0ea0905dfc7b3dc0c972273862654ffb576cfab17f')

package() {
    install -Dm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.rules" -t "${pkgdir}/usr/share/polkit-1/rules.d"
    install -Dm644 "${_pkgname}-split-dns.xml" "${pkgdir}/usr/share/dbus-1/system.d/${_pkgname}-split-dns.conf"
    install -Dm644 config.json -t "${pkgdir}/etc/${_pkgname}"

    declare -A arch_map=([x86_64]='amd64' [aarch64]='arm64')
    cd "${srcdir}/${_pkgname}-cagedbird-linux-${arch_map[$CARCH]}"

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 <("./${_pkgname}" completion bash) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 <("./${_pkgname}" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <("./${_pkgname}" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
