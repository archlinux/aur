# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemachine-cli
_pkgname=CodeMachine-CLI
pkgver=0.8.0
pkgrel=4
pkgdesc="Multi-agent workflow orchestration CLI"
arch=('x86_64')
url="https://github.com/moazbuilds/CodeMachine-CLI"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('bun' 'npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moazbuilds/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ac13dacf669ff5001ef6101ffae5b4e2f66470b5f95ea5fefeaabd365b2704c')

latestver() {
    gh api --paginate "repos/moazbuilds/${_pkgname}/tags" --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    rm -rf .tmp
    export npm_config_cache="${srcdir}/npm-cache"
    export npm_config_legacy_peer_deps=true
    export HUSKY=0
    npm install
    npm run build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export npm_config_cache="${srcdir}/npm-cache"
    export npm_config_legacy_peer_deps=true
    export HUSKY=0
    npm prune --omit=dev

    local install_dir="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${install_dir}"

    local _paths=(bin config docs prompts templates package.json node_modules)
    for _path in "${_paths[@]}"; do
        if [ -e "${_path}" ]; then
            cp -r --no-preserve=ownership "${_path}" "${install_dir}/"
        fi
    done

    rm -f \
        "${install_dir}/node_modules/@opentui/core/lib/tree-sitter/assets/update.d.ts" \
        "${install_dir}/node_modules/@opentui/solid/node_modules/@opentui/core/lib/tree-sitter/assets/update.d.ts"

    find "${install_dir}/node_modules" -type d -name man -exec rm -rf {} + 2>/dev/null || true
    find "${install_dir}/node_modules" -type d -empty -delete 2>/dev/null || true

    if [ -f "${install_dir}/bin/codemachine.js" ]; then
        sed -i '1s|^#!.*|#!/usr/bin/env node|' "${install_dir}/bin/codemachine.js"
    fi

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/codemachine" <<'EOF2'
#!/bin/bash
exec node /usr/lib/codemachine-cli/bin/codemachine.js "$@"
EOF2
    chmod +x "${pkgdir}/usr/bin/codemachine"
    ln -s codemachine "${pkgdir}/usr/bin/cm"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
