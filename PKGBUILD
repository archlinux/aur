# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=agentboard
pkgver=0.1.6
pkgrel=1
pkgdesc='Tiny realtime kanban board for AI agents and the humans watching them'
arch=('any')
url='https://agentboard.win'
license=('MIT')
depends=('nodejs>=24')
_mdit_ver=15.0.2
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/backmeupplz/agentboard/archive/refs/tags/v${pkgver}.tar.gz"
        "markdown-it-${_mdit_ver}.tgz::https://registry.npmjs.org/markdown-it/-/markdown-it-${_mdit_ver}.tgz"
        # pinned by SHA: the v0.1.6 tag predates the commit that added the license
        "LICENSE::https://raw.githubusercontent.com/backmeupplz/agentboard/e71e9fc9e527d313f0b2d6180399f55ca40f59d8/LICENSE"
        "agentboard.service")

latestver() {
    curl -fsSL 'https://api.github.com/repos/backmeupplz/agentboard/tags' |
        sed -nE 's/.*"name": *"v([0-9]+(\.[0-9]+)*)".*/\1/p' | sort -V | tail -1
}

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r "${pkgname}-${pkgver}"/{package.json,server.js,API.md,public,bin} \
        "${pkgdir}/usr/share/${pkgname}/"

    # server.js serves the frontend's markdown renderer from this exact path
    install -dm755 "${pkgdir}/usr/share/${pkgname}/node_modules"
    bsdtar -xf "${srcdir}/markdown-it-${_mdit_ver}.tgz" \
        -C "${pkgdir}/usr/share/${pkgname}/node_modules"
    mv "${pkgdir}/usr/share/${pkgname}/node_modules/package" \
        "${pkgdir}/usr/share/${pkgname}/node_modules/markdown-it"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/agentboard" <<'EOF'
#!/bin/sh
exec node --disable-warning=ExperimentalWarning /usr/share/agentboard/server.js
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/kb" <<'EOF'
#!/bin/sh
exec node /usr/share/agentboard/bin/kb.mjs "$@"
EOF

    install -Dm644 "${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('6eb27960ed65c9e41916b1301838f5b04cf48742bde9021d474658fce705d33f'
            '3237f5ecac432f99453e6d8d345b6e4764a22f1781c96e02dc9e89777b9c23c1'
            'de40f3bdd7bd3bfbd51f696ef04cb32f868839c18c666f75e8c10090d784c497'
            'SKIP')
