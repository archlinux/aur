# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
# Maintainer: Michael Bolden Jnr SM9(); <me@sm9.dev>

_pkgname='openasar-all'
pkgname="${_pkgname}-git"
pkgver=r788.40b27dd
pkgrel=1
pkgdesc="Open-source alternative of Discord desktop's app.asar"
arch=('i686' 'x86_64')
url="https://github.com/GooseMod/OpenAsar"
license=('MIT')
depends=('unzip')
makedepends=('git' 'asar' 'nodejs')
optdepends=('discord' 'discord-ptb' 'discord-canary' 'discord-development')
provides=("${_pkgname}")
conflicts=("openasar-git")
source=("git+${url}.git"
    "${pkgname}-post-upgrade-discord"
    "${pkgname}-discord-upgrade.hook"
    "${pkgname}-discord-ptb-upgrade.hook"
    "${pkgname}-discord-canary-upgrade.hook"
    "${pkgname}-discord-development-upgrade.hook"
    "${pkgname}-pre-remove-discord"
    "${pkgname}-discord-remove.hook"
    "${pkgname}-discord-ptb-remove.hook"
    "${pkgname}-discord-canary-remove.hook"
    "${pkgname}-discord-development-remove.hook"
)

sha512sums=('SKIP'
            'ed9ccf95e527e4c37cc600022f8073508fcc4a17b9589a987cf0d5b0441658b45cbdf8551977da0915deefb8f60078880d6300bbf5cdf038122809dd003a3c9b'
            '3f2e6a16ad02f5233b9f8e7e2441960c200955d1f3b5f4729c0b04ec6b97e73cb6cf7a788c469fbcaa8bdf8e07b5e0402b648e0be0478e6a35d72635ec52e885'
            '4627eabb571452b558d5d8d52055f42e7dda87d527d0bd7723cd40d88aff4b3470e329142854d386046e21a1218a846c6a1d6a757165a190deb84010c174610d'
            '74c59567a5e44df7483db6b65fcca658131a94782ecfbb0083ac34c9a7d105fa668839a1d532c3ab5e56f4a02d36313961b69dc26ad152e5cdf1c9762f85567a'
            'a1e77de22bf2c4483115d89f3d72e2432a6133044d837917ae6625c50e1268955c068460557133a40c9f16b9ec7fb6612511f6d5bae2d89edaeaf17b5b964da2'
            '87a887bae6fbf028dc106161003a12567559b8a2d910a20b0adebf356f0d686e4e52e845b3a6fb5dccad7e1b1be4324063ce0065c485b7dd7ce19860ba7ce78e'
            'f7c1b2f2085ae67c7b722f97f22a4e723560b24aa4b54d554fc71b10b513aeb2c8ff022d1167c6b0ea585209434f439ee3ec0ac08390f9f018604000acaf19c9'
            'cfd2fc580ec4a12588e3897aa8ed7e55721808e2fe830f4a532b3e5f9cb8184906769547e101e8dc434a30baf0d6962d4b7016fb71b02a17aa71e4745a6430dc'
            '7f70b13e6db2a374cbb6fd31ef8cc7ad8f9aab721f9a7b046ded6b7f2c4fd992096d909c789a71bf6fd38bb3173a2a14b1f39bdb4cde4360dd44a33d0492f965'
            '85408ae89fadfb1f704a43142d11ac4a9f16f5cfb8c61af9cf2c3f0affe45bcc2dd6dc2b3f293e9a5bc856fbd008704553a779b0578304f6724320440f339828')
install="$pkgname.install"

pkgver() {
    cd "${srcdir}/OpenAsar"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-post-upgrade-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm755 "${srcdir}/${pkgname}-pre-remove-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
    install -Dm644 "${srcdir}/${pkgname}-discord-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-ptb-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-canary-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-development-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-ptb-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-canary-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    install -Dm644 "${srcdir}/${pkgname}-discord-development-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
    cd "${srcdir}/OpenAsar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
    node scripts/strip.js
    asar pack src app.asar
    install -Dm 644 app.asar "${pkgdir}/opt/${pkgname}/app.asar"
}
