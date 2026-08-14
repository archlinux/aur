# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=command-code
pkgver=1.23.2
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
sha512sums=('1892777a0169651c6669d7199df4468a0c6c34b039419064c0b41452a761cd3824b4d1cddf51f1350aeb5f114322cf39741f4b8d5e773810c4bb0588016b2067'
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
