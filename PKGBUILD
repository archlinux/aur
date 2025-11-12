# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codemachine-cli
_pkgname=CodeMachine-CLI
pkgver=0.5.0
pkgrel=1
pkgdesc="Multi-agent workflow orchestration CLI"
arch=('any')
url="https://github.com/moazbuilds/CodeMachine-CLI"
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moazbuilds/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b607d1a6f827a897c95be4d483ea05717e80d28def6c43dbcd6cac6ef763bf8')

pkgver() {
    curl -fs "https://api.github.com/repos/moazbuilds/${_pkgname}/releases/latest" \
        | jq -r '.tag_name' | sed 's/^v//'
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export npm_config_cache="${srcdir}/npm-cache"
    export HUSKY=0
    npm ci
    npm run build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export npm_config_cache="${srcdir}/npm-cache"
    export HUSKY=0
    npm prune --omit=dev

    local install_dir="${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${install_dir}"

    local _paths=(config dist docs prompts templates package.json package-lock.json node_modules)
    for _path in "${_paths[@]}"; do
        if [ -e "${_path}" ]; then
            cp -r --no-preserve=ownership "${_path}" "${install_dir}/"
        fi
    done

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/codemachine" <<'EOF2'
#!/bin/bash
exec node /usr/lib/codemachine-cli/dist/index.js "$@"
EOF2
    chmod +x "${pkgdir}/usr/bin/codemachine"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
