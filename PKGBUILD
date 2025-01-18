# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder
pkgver=0.21.0
pkgrel=2
pkgdesc="A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search"
arch=("x86_64" "aarch64")
url="https://github.com/${pkgname}-app/${pkgname}"
license=('AGPL-3.0-or-later')
backup=("etc/${pkgname}/${pkgname}.env")
depends=("chromium" "nodejs>=22" "pnpm")
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
            '8a1e00f2d7472a2e3c1613992f2dbc5f1b1d3fe3fd830d985211eff0ad044676'
            'cd2b58e13dd928925db21819a74052b98c4dd82cf6353f6b9181b41cc93e8848'
            'fb543b04362e224f6f10b7e32cea60abef986525d13df4f3d4aa27f1f52807ff'
            '6d2aeef65a1b2e5915c00190329a827b2440271b130129f2ea4f79878169a0c1'
            'f800c1dea05dcd44e6105cb02b3a8e224353e360d5a997b3a90a5c5b90aa8c39')

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
