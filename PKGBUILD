# Maintainer: devome <evinedeng@hotmail.com>

pkgname=karakeep
pkgver=0.24.1
pkgrel=1
pkgdesc="A self-hostable bookmark-everything app (links, notes and images) with AI-based automatic tagging and full text search"
arch=("x86_64" "aarch64")
url="https://github.com/${pkgname}-app/${pkgname}"
license=('AGPL-3.0-or-later')
backup=("etc/${pkgname}/${pkgname}.env")
replaces=("hoarder")
depends=("chromium" "graphicsmagick" "ghostscript" "meilisearch" "monolith" "nodejs-lts-jod" "pnpm")
makedepends=("git" "jq" "nodejs-lts-jod" "pnpm" "python")
optdepends=("${pkgname}-cli: ${pkgname} cli tool"
            "ollama: for automatic tagging"
            "yt-dlp: for downloading video")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.env"
        "${pkgname}.sysusers"
        "${pkgname}.target"
        "${pkgname}.tmpfiles"
        "${pkgname}-browser.service"
        "${pkgname}-web.service"
        "${pkgname}-workers.service")
sha256sums=('8d4fb855de9e6ef5ba4a319bb0e38c17c4f7681d45590d7a574b24211c847766'
            'ce0ce4b582f5f8904b875475262ad47edb5f398517add9e6901bb5f065742d7d'
            '0b5193cdca50bf430f3387cd998f8848e1579ecafc8798400595581d961cc399'
            '9c7f0c9bd7864a95269e49d5f27eaecb1714637b5771d748c3437aa5c297d21e'
            '15ec782d5dc557a6aad15140a1b8098438e57012291f2a0f3542686f5eda93ea'
            'dc4ce21d936b7442e84eb521d8c519e02322808fbbadf23c27aa1bf4994fccf5'
            'a54472075f050b9d60083c8086da9b196391cf666bd6734f411df80cef806626'
            'b70f0a4ba817a00bc378ee9df5dbeb1098b1d98a747d7f53a53593f69af3585e')

prepare() {
    echo "After upgrading 'nodejs', you need to recompile '${pkgname}'..."
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
    pnpm deploy --node-linker=isolated --filter "@${pkgname}/workers" --prod workers

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
        sed -i "s|${srcdir}/${pkgname}/workers|/usr/lib/${pkgname}/apps/workers|g" "$file"
        sed -i "s|${srcdir}/${pkgname}|/usr/lib/${pkgname}|g" "$file"
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
