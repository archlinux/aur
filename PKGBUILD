# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder
pkgver=0.19.0
pkgrel=3
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
sha256sums=('1942d4f0f3ee8e7eac254b94aa0863b2c2a9c772c8fc62574c15b53eba4948d2'
            '1741afe407c55654462de14b0ec454775668dc42103f20448fc8025f646bf963'
            'bb7cf9d047374376137a9ec5ac5ad653d3569a834de8ccc3e8a6f04a870bc01e'
            '713e248fc61f429a3da627016343d89147dde147f739e51584f7398d11262896'
            'cd2b58e13dd928925db21819a74052b98c4dd82cf6353f6b9181b41cc93e8848'
            'eabf61d0cc9cf94bc535230160f870bc77437a58657e58cde261f667e35d7496'
            'b8de940803dc527416edae149c4182126c74b4dec7387c198c7217e4c4e16ef5'
            '361c24c7d54fe8ff613e52b042d245d321ce0385e53f879230288d2de43bfc01')

build() {
    export COREPACK_ENABLE_STRICT=0
    export SERVER_VERSION="$pkgver"
    # export NODE_ENV="production"
    export NEXT_TELEMETRY_DISABLED=1
    export PUPPETEER_SKIP_DOWNLOAD="true"

    # build web
    cd "${pkgname}"
    corepack use $(jq -r '.packageManager' package.json)
    cd packages/db
    pnpm dlx @vercel/ncc build migrate.ts -o ../../db_migrations
    cp -R drizzle ../../db_migrations
    cd ../../apps/web
    pnpm exec next build --experimental-build-mode compile

    # build workers
    cd ../..
    rm -rf workers &>/dev/null
    pnpm install
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

    cd "${pkgname}"
    cp -r "apps/web/.next/standalone"     "${pkgdir}/usr/lib/${pkgname}"
    cp -r "db_migrations"                 "${pkgdir}/usr/lib/${pkgname}/db_migrations"
    cp -r "workers"                       "${pkgdir}/usr/lib/${pkgname}/apps/workers"
    cp -r "apps/web/.next/static"         "${pkgdir}/usr/lib/${pkgname}/apps/web/.next/static"
    cp -r "apps/web/public"               "${pkgdir}/usr/lib/${pkgname}/apps/web/public"
    ln -s "/var/lib/${pkgname}/cache"     "${pkgdir}/usr/lib/${pkgname}/apps/web/.next/cache"
    echo "SERVER_VERSION=$pkgver" >       "${pkgdir}/usr/lib/${pkgname}/version"
}
