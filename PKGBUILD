# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder
pkgver=0.21.0
pkgrel=1
pkgdesc="A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search"
arch=("x86_64" "aarch64")
url="https://github.com/${pkgname}-app/${pkgname}"
license=('AGPL-3.0-or-later')
backup=("etc/${pkgname}/${pkgname}.env")
depends=("chromium" "nodejs>=22" "pnpm" "redis")
makedepends=("git" "jq" "pnpm")
optdepends=("${pkgname}-cli: ${pkgname} cli tool"
            "meilisearch: for full text search"
            "ollama: for automatic tagging"
            "yt-dlp: for download video")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.env"
        "${pkgname}.sysusers"
        "${pkgname}.target"
        "${pkgname}.tmpfiles"
        "${pkgname}-browser.service"
        "${pkgname}-web.service"
        "${pkgname}-workers.service")
sha256sums=('e045142478637c85b36eac67a3569ec7b511bafa5d3d099f397953d3957860ee'
            '1741afe407c55654462de14b0ec454775668dc42103f20448fc8025f646bf963'
            'bb7cf9d047374376137a9ec5ac5ad653d3569a834de8ccc3e8a6f04a870bc01e'
            '713e248fc61f429a3da627016343d89147dde147f739e51584f7398d11262896'
            'cd2b58e13dd928925db21819a74052b98c4dd82cf6353f6b9181b41cc93e8848'
            '0fcaf8b03f475e93fc6d84b9f9cfe4d87c3c60baf294b93bb5c69586971e21b4'
            '7a4478c4fa6a7b60566d8b8fdb46a4c2f33d094e8fb728e281b204990a210f13'
            'c83bbf444472b557b20865b8c3c8dc00e59a1c5978f02398d909407ee00efeae')

prepare() {
    echo "After upgrading 'nodejs', you need to recompile 'hoarder'..."
    if type yarn &>/dev/null; then
        echo "Please uninstall 'yarn' first..."
        exit 1
    fi
}

build() {
    export COREPACK_ENABLE_STRICT=0
    export SERVER_VERSION="$pkgver"
    # export NODE_ENV="production"
    export NEXT_TELEMETRY_DISABLED=1
    export PUPPETEER_SKIP_DOWNLOAD="true"

    # build web
    cd "${pkgname}"
    corepack use $(jq -r '.packageManager' package.json)
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
    find {apps/web/.next,workers} -type d -name "*musl*" | xargs rm -rf
    find workers -type f -name "*.map" | xargs rm -rf
    find workers -type d \( -name "darwin-" -o -name "ios-arm*" -o -name "ios-x64*" -o -name "win32-*" -o -name "android-*" \) | xargs rm -rf
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

    cd "${pkgname}"
    cp -r "apps/web/.next/standalone"     "${pkgdir}/usr/lib/${pkgname}"
    cp -r "db_migrations"                 "${pkgdir}/usr/lib/${pkgname}/db_migrations"
    cp -r "workers"                       "${pkgdir}/usr/lib/${pkgname}/apps/workers"
    cp -r "apps/web/.next/static"         "${pkgdir}/usr/lib/${pkgname}/apps/web/.next/static"
    cp -r "apps/web/public"               "${pkgdir}/usr/lib/${pkgname}/apps/web/public"
    ln -s "/var/lib/${pkgname}/cache"     "${pkgdir}/usr/lib/${pkgname}/apps/web/.next/cache"
    echo "SERVER_VERSION=$pkgver" >       "${pkgdir}/usr/lib/${pkgname}/version"
}
