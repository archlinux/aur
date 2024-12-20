# Maintainer: envolution
# Contributor: devome <evinedeng@hotmail.com>

pkgname=lobe-chat
pkgver=1.36.37
pkgrel=1
pkgdesc="An open-source, modern-design LLMs/AI chat framework"
arch=("x86_64" "aarch64")
url="https://github.com/lobehub/${pkgname}"
license=('Apache-2.0')
depends=("nodejs" "nvm")
makedepends=("npm" "pnpm")
optdepends=("ollama: ollama backend")
backup=("etc/default/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-launch.sh"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('7806850af4de27a7c06890912c3e0c236cd2215e36027feab6912b67ad6902f0'
            '31425770cc37294fe223755f33a1dde387250f36d25e36d47d46de0962f3f8e5'
            '43143b06b5418e718fafa404999f6f1266a8f11c7427d93b81a23a2a0b348595'
            '4205728d7528ccc94f2a9eb25655cf4bed59502be3726f17da814355c540f528'
            'b370a660e91eacd7fee44691ff8de4446f4c8f36634a2d96a2f982b5fea9a0a6'
            '2e5323c4dc10d815cf3ffcee0fb9fa33dba5c95b2c28055e4c5b4f551bdc5049')

_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install
    nvm use
    echo "in _ensure nvm dir = ${NVM_DIR}"
}

build() {
    export COREPACK_ENABLE_STRICT=0
    export NEXT_TELEMETRY_DISABLED=1
    export NODE_OPTIONS='--max-old-space-size=8192'
    export PUPPETEER_SKIP_DOWNLOAD="true"

    # build web
    cd "${pkgname}-${pkgver}"
    _ensure_local_nvm
    echo "in build() nvm dir = ${NVM_DIR}"
    pnpm install --cache "${srcdir}/npm-cache"
    npm run build:docker

    # delete map file
    find .next/standalone -type f -iname "*.map" -delete

    # fix path
    grep -rl "${srcdir}/${pkgname}-${pkgver}" .next | xargs -I {} sed -i "s|${srcdir}/${pkgname}-${pkgver}|/usr/share/${pkgname}|g" "{}"

    # delete musl file
    rm -rf .next/standalone/node_modules/.pnpm/*musl*
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}/.nvm"
    install -Dm755 "${pkgname}-launch.sh"   "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 "${pkgname}.env"        "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"   "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"   "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cp -r --preserve=mode .nvm             "${pkgdir}/usr/share/${pkgname}/"

    cd "${pkgname}-${pkgver}"
    install -Dm644 README*.md           -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 .nvmrc               -t "${pkgdir}/usr/share/${pkgname}/"

    shopt -s dotglob
    cp -r --preserve=mode .next/standalone/* "${pkgdir}/usr/share/${pkgname}/"

    mkdir -p "${pkgdir}/usr/share/${pkgname}/.next"
    cp -r --preserve=mode .next/static     "${pkgdir}/usr/share/${pkgname}/.next/"
    cp -r --preserve=mode public           "${pkgdir}/usr/share/${pkgname}/"

    mkdir -p "${pkgdir}/var/lib/${pkgname}/cache"
    ln -s "/var/lib/${pkgname}/cache"      "${pkgdir}/usr/share/${pkgname}/.next/cache"
}
