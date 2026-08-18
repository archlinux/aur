# Maintainer: devome <evinedeng@hotmail.com>

# _electron="electron35"
_reponame=ChatLab
pkgbase="${_reponame,,}"
pkgname=("${pkgbase}-cli") # desktop已无法构建
pkgver=0.36.1
pkgrel=1
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/${_reponame}/${_reponame}"
license=("GPL-3.0-or-later")
makedepends=("npm" "pnpm" "python")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}-api.service"
        "${pkgbase}-api@.service"
        "${pkgbase}-web.service"
        "${pkgbase}-web@.service")
        # "${pkgbase}-desktop.sh"
        # "${pkgbase}.desktop"
sha256sums=('4f1a7a98962b72942dc8f460e221ad8626906c8f1efbea075d1bc964004ded7d'
            'fa7f906b1ee598b988b8003dfa9f9d554d7d45d6220f3f56dffde9ae34e2fe6d'
            'b006b2086c9da9baf8bd17f369ec09164a9c356663930fae595cf2b5cafae490'
            '2cdf8e8924b9290bfa563d809eedb8ed3fc1910cba17fad31ffb46ddd6de0a33'
            'f60141fbaea85fd842374455dd838950191907011ef8502c472317f6ebb1674c')

prepare() {
    # sed -i "s|_ELECTRON_VERSION_|$_electron|" "${pkgbase}-desktop.sh"

    # export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    # export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    cd "${_reponame}-${pkgver}"
    NODE_ENV="development" pnpm install
    find node_modules -type f -name "*.map" -delete
    npm pkg set version="${pkgver}" --prefix="apps/cli"
    # npm pkg set version="${pkgver}" --prefix="apps/desktop"
}

build() {
    # build cli
    cd "${_reponame}-${pkgver}/apps/cli"
    pnpm run build:full
    find . -type f -name "*.map" -delete
    sed -i 's|#!/usr/bin/env node|#!/usr/bin/node|' "bin/${pkgbase}.mjs"
    pnpm pack --pack-destination "${srcdir}"

    # build desktop
    # cd ../desktop
    # pnpm run build
    # pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
}

package_chatlab-cli() {
    pkgdesc+=" (cli & service)"
    depends=("nodejs")

    npm install -g --prefix "${pkgdir}"      "${pkgname}-${pkgver}.tgz"
    install -Dm644 "${pkgbase}-api.service"  "${pkgdir}/usr/lib/systemd/user/${pkgbase}-api.service"
    install -Dm644 "${pkgbase}-web.service"  "${pkgdir}/usr/lib/systemd/user/${pkgbase}-web.service"
    install -Dm644 "${pkgbase}-api@.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-api@.service"
    install -Dm644 "${pkgbase}-web@.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-web@.service"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"               "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

# package_chatlab-desktop() {
#     pkgdesc+=" (desktop app)"
#     depends=("bash" "${_electron}" "hicolor-icon-theme")
#     provides=("${pkgbase}")
#     conflicts=("${pkgbase}")
#     replaces=("${pkgbase}")
#     install="${pkgbase}.install"

#     install -Dm644 "${pkgbase}.desktop"   "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
#     install -Dm755 "${pkgname}.sh"        "${pkgdir}/usr/bin/${pkgname}"

#     cd "${_reponame}-${pkgver}"
#     install -Dm644 "README.md"            "${pkgdir}/usr/share/doc/${pkgname}/README.md"

#     cd apps/desktop
#     install -Dm644 "build/icon.png"       "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
#     install -dm755                        "${pkgdir}/usr/lib/${pkgbase}"
#     cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgbase}/desktop"

#     cd ../../docs
#     find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
# }
