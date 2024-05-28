# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=hoarder
pkgname=("${pkgbase}" "${pkgbase}-cli")
pkgver=0.14.0
pkgrel=4
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
            '02ba5c278843be0dc98a172a16e172dd5f2245dd7e91608fc3a53f9e5be2ee7a'
            'bb7cf9d047374376137a9ec5ac5ad653d3569a834de8ccc3e8a6f04a870bc01e'
            'cd2b58e13dd928925db21819a74052b98c4dd82cf6353f6b9181b41cc93e8848'
            '2364decec460b4bb27e8eb8a3b99b3364f4b95b8cdc51876261faa5de24ad027'
            'f91a01baa9953fa163534371fa515d680dcfc46184ea80e0fd7ac82723e56d4c'
            '750941fb711f95239b4aacf278a42d9c75b80ef75c730ecc99940510b2b57cda')

build() {
    export COREPACK_ENABLE_STRICT=0
    export SERVER_VERSION="$pkgver"
    # export NODE_ENV="production"
    export NEXT_TELEMETRY_DISABLED=1
    export PUPPETEER_SKIP_DOWNLOAD="true"

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
    depends=("chromium" "nodejs" "pnpm" "redis")
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

    ln -s                 "/var/lib/${pkgbase}/cache"            "${pkgdir}/usr/share/${pkgbase}/apps/web/.next/cache"
    echo "SERVER_VERSION=$pkgver" >                              "${pkgdir}/usr/share/${pkgbase}/version"
}

package_hoarder-cli() {
    pkgdesc="${_pkgdesc} (cli tool)"
    depends=("nodejs")
    provides=("${pkgbase}-cli")

    install -Dm755 "${pkgbase}/apps/cli/dist/index.mjs" "${pkgdir}/usr/share/${pkgbase}/apps/cli/index.mjs"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgbase}/apps/cli/index.mjs" "${pkgdir}/usr/bin/${pkgbase}"
}
