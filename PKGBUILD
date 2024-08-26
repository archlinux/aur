# Maintainer: devome <evinedeng@hotmail.com>

pkgname=lobe-chat
pkgver=1.12.20
pkgrel=1
pkgdesc="An open-source, modern-design LLMs/AI chat framework"
arch=("x86_64" "aarch64")
url="https://github.com/lobehub/${pkgname}"
license=('Apache-2.0')
depends=("nodejs")
makedepends=("pnpm")
optdepends=("ollama: ollama backend")
backup=("etc/default/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('c611c1ddc7f86f10906cf52fc5d9160ab2e9df87444c46101b6183446fb6ca2d'
            '43143b06b5418e718fafa404999f6f1266a8f11c7427d93b81a23a2a0b348595'
            '2dd8de2018bce82b092ac5fd70ad1ed09537a685270dcef0e2811cf1692c5382'
            'b370a660e91eacd7fee44691ff8de4446f4c8f36634a2d96a2f982b5fea9a0a6'
            '2e5323c4dc10d815cf3ffcee0fb9fa33dba5c95b2c28055e4c5b4f551bdc5049')

build() {
    export COREPACK_ENABLE_STRICT=0
    export NEXT_TELEMETRY_DISABLED=1
    export PUPPETEER_SKIP_DOWNLOAD="true"

    # build web
    cd "${pkgname}-${pkgver}"
    pnpm install --cache "${srcdir}/npm-cache"
    pnpm run build:docker

    # delete map file
    find .next/standalone -type f -iname "*.map" | xargs rm -rf

    # fix path
    grep -rl "${srcdir}/${pkgname}-${pkgver}" .next | xargs -I {} sed -i "s|${srcdir}/${pkgname}-${pkgver}|/usr/share/${pkgname}|g" "{}"

    # delete musl file
    rm -rf .next/standalone/node_modules/.pnpm/*musl*
}

package() {
    install -Dm644 "${pkgname}.env"        "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"   "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"   "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm644 README*.md           -t "${pkgdir}/usr/share/doc/${pkgname}"

    cp -r --preserve=mode .next/standalone "${pkgdir}/usr/share/${pkgname}"
    cp -r --preserve=mode .next/static     "${pkgdir}/usr/share/${pkgname}/.next/static"
    cp -r --preserve=mode public           "${pkgdir}/usr/share/${pkgname}/public"

    ln -s "/var/lib/${pkgname}/cache"      "${pkgdir}/usr/share/${pkgname}/.next/cache"
}
