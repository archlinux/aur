# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder
pkgver=0.18.0
pkgrel=1
pkgdesc="A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search"
arch=("x86_64" "aarch64")
url="https://github.com/${pkgname}-app/${pkgname}"
license=('AGPL-3.0-or-later')
backup=("etc/${pkgname}/${pkgname}.env")
depends=("chromium" "nodejs" "pnpm" "redis")
optdepends=("meilisearch: for full text search"
            "ollama: for automatic tagging"
            "${pkgname}-cli: ${pkgname} cli tool")
makedepends=("git")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.env"
        "${pkgname}.sysusers"
        "${pkgname}.target"
        "${pkgname}.tmpfiles"
        "${pkgname}-browser.service"
        "${pkgname}-web.service"
        "${pkgname}-workers.service")
sha256sums=('b74fd32cb3ba0695e530cc19dd7321bc4d0d5a887630eeb72db453d76c50dff6'
            '1741afe407c55654462de14b0ec454775668dc42103f20448fc8025f646bf963'
            'bb7cf9d047374376137a9ec5ac5ad653d3569a834de8ccc3e8a6f04a870bc01e'
            '713e248fc61f429a3da627016343d89147dde147f739e51584f7398d11262896'
            'cd2b58e13dd928925db21819a74052b98c4dd82cf6353f6b9181b41cc93e8848'
            '67e540e691362a4696e2d7575fd4cf269eaa16a032fd4bf974ae41733bdc6be2'
            '1c42c86c6245c04f9da4d97fc4cb0100ce8a69784692fe2b30069940a4de31bf'
            'ebbca6d919fdb201177a816e6a9a9d634f2ee3df222a1d43d38b9a280b593544')

prepare() {
    # fix ERR_PACKAGE_PATH_NOT_EXPORTED error
    cd "${pkgname}"
    sed -i 's|"execa": "^9.1.0",|"execa": "9.1.0",|' apps/workers/package.json
}

build() {
    export COREPACK_ENABLE_STRICT=0
    export SERVER_VERSION="$pkgver"
    # export NODE_ENV="production"
    export NEXT_TELEMETRY_DISABLED=1
    export PUPPETEER_SKIP_DOWNLOAD="true"

    # build web
    cd "${pkgname}"
    pnpm install
    cd packages/db
    pnpm dlx @vercel/ncc build migrate.ts -o ../../db_migrations
    cp -R drizzle ../../db_migrations
    cd ../../apps/web
    pnpm exec next build --experimental-build-mode compile

    # build workers
    cd ../..
    rm -rf workers &>/dev/null
    pnpm deploy --node-linker=isolated --filter @hoarder/workers --prod workers

    # delete musl files, macos/win/android files, map file
    find apps/web/.next -type d -name "*musl*" | xargs rm -rf
    find workers -type f -name "*.map" | xargs rm -rf
    find workers -type d \( -name "darwin-arm64" -o -name "darwin-x64" -o -name "win32-x64" -o -name "android-arm*" \) | xargs rm -rf
    case $CARCH in
        x86_64)  find workers -type d -name "linux-arm64" | xargs rm -rf;;
        aarch64) find workers -type d -name "linux-x64"   | xargs rm -rf;;
    esac

    # fix path
    while read file; do
        sed -i "s|${srcdir}/${pkgname}/workers|/usr/share/${pkgname}/apps/workers|g" "$file"
        sed -i "s|${srcdir}/${pkgname}|/usr/share/${pkgname}|g" "$file"
    done <<< $(grep -rl "${srcdir}/${pkgname}" .)
}

package() {
    install -Dm644 *.{service,target}  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${pkgname}.env"       "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "${pkgname}.sysusers"  "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"  "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cp -r --preserve=mode "${pkgname}/apps/web/.next/standalone" "${pkgdir}/usr/share/${pkgname}"
    cp -r --preserve=mode "${pkgname}/db_migrations"             "${pkgdir}/usr/share/${pkgname}/db_migrations"
    cp -r --preserve=mode "${pkgname}/workers"                   "${pkgdir}/usr/share/${pkgname}/apps/workers"
    cp -r --preserve=mode "${pkgname}/apps/web/.next/static"     "${pkgdir}/usr/share/${pkgname}/apps/web/.next/static"
    cp -r --preserve=mode "${pkgname}/apps/web/public"           "${pkgdir}/usr/share/${pkgname}/apps/web/public"

    ln -s                 "/var/lib/${pkgname}/cache"            "${pkgdir}/usr/share/${pkgname}/apps/web/.next/cache"
    echo "SERVER_VERSION=$pkgver" >                              "${pkgdir}/usr/share/${pkgname}/version"
}
