# Maintainer: devome <evinedeng@hotmail.com>

_electron="electron35"
_reponame=ChatLab
pkgbase="${_reponame,,}"
pkgname=("${pkgbase}-cli" "${pkgbase}-desktop")
pkgver=0.20.0
pkgrel=2
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/hellodigua/${_reponame}"
license=("GPL-3.0-only")
makedepends=("npm" "pnpm" "python")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}.desktop"
        "${pkgbase}.sh")
sha256sums=('b2d306e957e9d5d8dd4b0a7f2f9fa055ad764441bd805ff2fb2db01c2607e5be'
            '349a64162923e2fcea32cde43af8e5da44d864b31e3050f3c4031c75744e60b0'
            '018864695044b9188a291a0c30db9322cba764f29198fd2014fbb0c43b1c0103')

prepare() {
    sed -i "s|_ELECTRON_VERSION_|$_electron|" "${pkgbase}.sh"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    cd "${_reponame}-${pkgver}/apps/cli"
    local _jieba=$(npm pkg get "optionalDependencies.@node-rs/jieba" | sed 's|\"||g')
    npm pkg delete "optionalDependencies.@node-rs/jieba"
    npm pkg set "dependencies.@node-rs/jieba"="$_jieba"
    npm pkg set version="${pkgver}"

    cd ../..
    rm -rf "${pkgbase}-cli" 2>/dev/null || true
    NODE_ENV="development" pnpm install
    find node_modules -type f \( -name "*.js.map" -o -name "*.mjs.map" -o -name "*.css.map" \) -delete
}

build() {
    cd "${_reponame}-${pkgver}"
    
    # build cli
    pnpm --prefix="apps/cli" run build:full
    pnpm deploy --filter "${pkgbase}-cli" --prod "${pkgbase}-cli"
    find "${pkgbase}-cli" -type f \( -name "*.js.map" -o -name "*.mjs.map" -o -name "*.css.map" \) -delete
    sed -i "s|#!/usr/bin/env node|#!/usr/bin/node|" "${pkgbase}-cli/bin/${pkgbase}.mjs"
    grep -rl "${srcdir}/${_reponame}-${pkgver}/${pkgbase}-cli" "${pkgbase}-cli" | xargs -I {} sed -i "s|${srcdir}/${_reponame}-${pkgver}/${pkgbase}-cli|/usr/lib/${pkgbase}/cli|g" {} 
    grep -rl "${srcdir}/${_reponame}-${pkgver}/apps/cli" "${pkgbase}-cli" | xargs -I {} sed -i "s|${srcdir}/${_reponame}-${pkgver}/apps/cli|/usr/lib/${pkgbase}/cli|g" {} 

    # build desktop
    pnpm --prefix="apps/desktop" run build
    pnpm --prefix="apps/desktop" exec electron-builder --linux dir --config electron-builder.yml --publish never
    rm -rf "apps/desktop/dist/linux-unpacked/resources/app-update.yml"
}

package_chatlab-cli() {
    pkgdesc+=" (cli tool)"
    depends=("nodejs")

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgbase}"
    cp -r "${pkgname}" "${pkgdir}/usr/lib/${pkgbase}/cli"
    ln -s "/usr/lib/${pkgbase}/cli/bin/${pkgbase}.mjs" "${pkgdir}/usr/bin/${pkgbase}"

    cd docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

package_chatlab-desktop() {
    pkgdesc+=" (desktop app)"
    depends=("bash" "${_electron}" "hicolor-icon-theme")
    provides=("${pkgbase}")
    conflicts=("${pkgbase}")
    replaces=("${pkgbase}")
    install="${pkgbase}.install"

    install -Dm644 "${pkgbase}.desktop"   "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
    install -Dm755 "${pkgbase}.sh"        "${pkgdir}/usr/bin/${pkgname}"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"            "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd apps/desktop
    install -Dm644 "build/icon.png"       "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
    install -dm755                        "${pkgdir}/usr/lib/${pkgbase}"
    cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgbase}/desktop"

    cd ../../docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
