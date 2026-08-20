# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=command-code
pkgver=1.28.3
pkgrel=1
pkgdesc='AI coding agent that continuously learns your coding taste'
arch=('x86_64')
url='https://commandcode.ai'
license=('LicenseRef-command-code')
depends=('nodejs>=22')
makedepends=('npm')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('fb8479edf07fa58ea5ec651cc8f71873b745b13ff861ae2f240c741b19d6d8543e30d07fba352fb76bc3482a0333c05cdd2e212a20fd5efbbc8cc28dc2b62bd9'
            '3a21c0ece6566af238a2f34cf9ca9a5453b992e828a09bbe1a9c5ce0fda8d7ba382bcbdf7b2eb5563009af6f8ba71f2dbeca7b66ac9bcb148ef0dca25788ad13')

package() {
    npm install -g \
        --no-audit \
        --no-fund \
        --ignore-scripts \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    local entry
    entry="$(readlink -f "${pkgdir}/usr/bin/cmd")"
    entry="${entry#$pkgdir}"

    rm -f "${pkgdir}/usr/bin/cmd" \
          "${pkgdir}/usr/bin/cmdc" \
          "${pkgdir}/usr/bin/command-code" \
          "${pkgdir}/usr/bin/commandcode"

    for bin in cmd cmdc command-code commandcode; do
        install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${bin}" << WRAPPER
#!/bin/sh
if [ "\$1" = "update" ]; then
    echo "command-code is managed by your package manager. Upgrade via your AUR helper."
    exit 0
fi
COMMANDCODE_SKIP_UPDATES=1 exec ${entry} "\$@"
WRAPPER
    done

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
