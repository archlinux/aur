# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=hoarder
pkgname=("${pkgbase}" "${pkgbase}-cli")
pkgver=0.14.0
pkgrel=1
_pkgdesc="A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search"
arch=("x86_64")
url="https://github.com/${pkgbase}-app/${pkgbase}"
license=('AGPL-3.0-or-later')
makedepends=("git" "pnpm")
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}"
        "${pkgbase}.env"
        "${pkgbase}.sysusers"
        "${pkgbase}.tmpfiles"
        "${pkgbase}.service"
        "${pkgbase}-browser.service"
        "${pkgbase}-workers.service")
sha256sums=('d863c41bdaab0ad697c94a75678308c6b692a402958658f4e2882f82a77e14af'
            '846524b921499db2e2f49ea05c4d88a5c92376a13905ee677be0681a8be4c5ab'
            'bb7cf9d047374376137a9ec5ac5ad653d3569a834de8ccc3e8a6f04a870bc01e'
            '2ed8abfab0df920e19bf2847afa0138bf9fa2dc6e9daa395cfdf72a9318df456'
            '743b1d08eaa1c38fab3561c7e5010e1de3db3e1984abf0f04ef415f941ff0bf6'
            '7f7859fd9b5a8e5843163de5ba842260c781db4e137b922ed586a38beb1aacab'
            '750941fb711f95239b4aacf278a42d9c75b80ef75c730ecc99940510b2b57cda')

build() {
    export COREPACK_ENABLE_STRICT=0

    # build web
    cd "${pkgbase}"
    pnpm install
    cd packages/db
    pnpm dlx @vercel/ncc build migrate.ts -o ../../db_migrations
    cp -R drizzle ../../db_migrations
    cd ../../apps/web
    pnpm next experimental-compile

    # build workers
    cd ../..
    pnpm deploy --node-linker=isolated --filter @hoarder/workers --prod workers

    # build cli
    cd apps/cli
    pnpm run build
}

package_hoarder() {
    pkgdesc="${_pkgdesc}"
    backup=("etc/${pkgbase}/${pkgbase}.env")
    depends=("google-chrome" "nodejs" "pnpm" "redis")
    provides=("${pkgbase}")
    optdepends=("meilisearch: for full text search"
                "ollama: for automatic tagging"
                "${pkgbase}-cli: ${pkgbase} cli tool")

    install -Dm644 *.service           -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${pkgbase}.env"       "${pkgdir}/etc/${pkgbase}/${pkgbase}.env"
    install -Dm644 "${pkgbase}.sysusers"  "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
    install -Dm644 "${pkgbase}.tmpfiles"  "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
    install -Dm644 "${pkgbase}/README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"

    cp -r --preserve=mode "${pkgbase}/apps/web/.next/standalone" "${pkgdir}/usr/share/${pkgbase}"
    cp -r --preserve=mode "${pkgbase}/db_migrations"             "${pkgdir}/usr/share/${pkgbase}/db_migrations"
    cp -r --preserve=mode "${pkgbase}/workers"                   "${pkgdir}/usr/share/${pkgbase}/apps/workers"
    cp -r --preserve=mode "${pkgbase}/apps/web/.next/static"     "${pkgdir}/usr/share/${pkgbase}/apps/web/.next/static"
    cp -r --preserve=mode "${pkgbase}/apps/web/public"           "${pkgdir}/usr/share/${pkgbase}/apps/web/public"
}

package_hoarder-cli() {
    pkgdesc="${_pkgdesc} (cli tool)"
    depends=("nodejs" "${pkgbase}")
    provides=("${pkgbase}-cli")

    install -Dm755 "${pkgbase}/apps/cli/dist/index.mjs" "${pkgdir}/usr/share/${pkgbase}/apps/cli/index.mjs"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgbase}/apps/cli/index.mjs" "${pkgdir}/usr/bin/${pkgbase}"
}
