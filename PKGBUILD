# Maintainer: devome <evinedeng@hotmail.com>

_electron="electron35"
_reponame=ChatLab
pkgbase="${_reponame,,}"
pkgname=("${pkgbase}-cli" "${pkgbase}-desktop")
pkgver=0.26.2
pkgrel=1
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/${_reponame}/${_reponame}"
license=("GPL-3.0-only")
makedepends=("npm" "pnpm" "python")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}-api.service"
        "${pkgbase}-api@.service"
        "${pkgbase}-web.service"
        "${pkgbase}-web@.service"
        "${pkgbase}-desktop.sh"
        "${pkgbase}.desktop")
sha256sums=('7521ff9ff98fa3be0e4b611cd43fd078528773a48e314f3699c871999dbcaa35'
            '82c5f90bb3ec326c87f0f2d71dda73f17b3871f61bb5a191f0be1e88d0b9a9c9'
            '4dcdf4d5d07e107c3a52bbb641a6f02084335d06c4501854c6bd17aa776a2e14'
            '3821adac2e719fb61967f438531eb5be8bbcd78b46e4c35cf9750a57b68393c4'
            '27f623c2731fb8c48c86cab923a67d37eb39db433cf5892972889d224f15c5ae'
            '018864695044b9188a291a0c30db9322cba764f29198fd2014fbb0c43b1c0103'
            '349a64162923e2fcea32cde43af8e5da44d864b31e3050f3c4031c75744e60b0')

prepare() {
    sed -i "s|_ELECTRON_VERSION_|$_electron|" "${pkgbase}-desktop.sh"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    cd "${_reponame}-${pkgver}"
    NODE_ENV="development" pnpm install
    find node_modules -type f -name "*.map" -delete
    npm pkg set version="${pkgver}" --prefix="apps/cli"
    npm pkg set version="${pkgver}" --prefix="apps/desktop"
}

build() {
    # build cli
    cd "${_reponame}-${pkgver}/apps/cli"
    pnpm run build:full
    find . -type f -name "*.map" -delete
    sed -i 's|#!/usr/bin/env node|#!/usr/bin/node|' "bin/${pkgbase}.mjs"
    pnpm pack --pack-destination "${srcdir}"
    rm -rf "${srcdir}/${pkgbase}-cli" &>/dev/null || true
    npm install --prefix="${srcdir}/${pkgbase}-cli" "${srcdir}/${pkgbase}-cli-${pkgver}.tgz"
    find "${srcdir}/${pkgbase}-cli" -type f -name "*.map" -delete

    # build desktop
    cd ../desktop
    pnpm run build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
}

package_chatlab-cli() {
    pkgdesc+=" (cli & service)"
    depends=("nodejs")

    local _tgtbin="../lib/${pkgbase}/cli/node_modules/.bin/${pkgbase}"

    install -Dm644 "${pkgbase}-api.service"  "${pkgdir}/usr/lib/systemd/user/${pkgbase}-api.service"
    install -Dm644 "${pkgbase}-web.service"  "${pkgdir}/usr/lib/systemd/user/${pkgbase}-web.service"
    install -Dm644 "${pkgbase}-api@.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-api@.service"
    install -Dm644 "${pkgbase}-web@.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-web@.service"
    install -dm755 "${pkgdir}/usr/bin"       "${pkgdir}/usr/lib/${pkgbase}"
    cp -ar --preserve=mode "${pkgbase}-cli"  "${pkgdir}/usr/lib/${pkgbase}/cli"
    ln -s "${_tgtbin}"                       "${pkgdir}/usr/bin/${pkgbase}"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"               "${pkgdir}/usr/share/doc/${pkgname}/README.md"

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
    install -Dm755 "${pkgname}.sh"        "${pkgdir}/usr/bin/${pkgname}"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"            "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd apps/desktop
    install -Dm644 "build/icon.png"       "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
    install -dm755                        "${pkgdir}/usr/lib/${pkgbase}"
    cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgbase}/desktop"

    cd ../../docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
