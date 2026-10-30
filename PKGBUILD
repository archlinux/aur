# Maintainer: pika02

pkgname=opencode-studio
pkgver=2.5.1
pkgrel=1
pkgdesc='Local GUI for managing OpenCode configurations (MCP, skills, plugins, auth, profiles)'
# Native binaries from npm packages (sharp, @parcel/watcher, @swc/core) limit arch
arch=('x86_64')
url='https://github.com/Microck/opencode-studio'
license=('MIT')
depends=('nodejs>=22' 'hicolor-icon-theme')
optdepends=('opencode: the OpenCode CLI managed by Studio')
makedepends=('npm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Microck/opencode-studio/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        "LICENSE")
sha256sums=('bafdcc4677fd36472f3f2394243f0175b40095da2a6f201b82f9afb7c97fbf05'
            '157ade89329aa28a1ae016dafd3ebfe9a15a6311fd5e2745155fe78112868e1e'
            'd45166e04c2e00c3022e81ee8589c91af8d1b145a1a76cc096c753d07c1180c1'
            '0839da86c99f1925089db74e2dda71b102be8b29bc1a905ad20e3c13b71f1a77')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export npm_config_fund=false
    export npm_config_audit=false
    export NEXT_TELEMETRY_DISABLED=1

    # Backend (published on npm as opencode-studio-server)
    (cd server && npm ci)

    # Frontend (Next.js, standalone output)
    (
        cd client-next
        npm ci
        export NEXT_PUBLIC_APP_VERSION="$pkgver"
        npx next build
    )
}

package() {
    install -d "$pkgdir/usr/lib/$pkgname"

    # Backend
    cp -a "$srcdir/$pkgname-$pkgver/server" "$pkgdir/usr/lib/$pkgname/server"

    # Frontend: Next.js standalone server + static assets
    cd "$srcdir/$pkgname-$pkgver/client-next"
    cp -a .next/standalone "$pkgdir/usr/lib/$pkgname/client"
    # Rewrite build-machine paths embedded by the standalone output
    sed -i "s|$srcdir/$pkgname-$pkgver/client-next|/usr/lib/$pkgname/client|g" \
        "$pkgdir/usr/lib/$pkgname/client/server.js" \
        "$pkgdir/usr/lib/$pkgname/client/.next/required-server-files.json"
    install -d "$pkgdir/usr/lib/$pkgname/client/.next"
    cp -a .next/static "$pkgdir/usr/lib/$pkgname/client/.next/static"
    cp -a public "$pkgdir/usr/lib/$pkgname/client/public"

    # Drop prebuilt musl binaries; this package targets Arch (glibc)
    rm -rf "$pkgdir/usr/lib/$pkgname/client/node_modules/@img/sharp-libvips-linuxmusl-x64" \
           "$pkgdir/usr/lib/$pkgname/client/node_modules/@img/sharp-linuxmusl-x64"

    # Launcher, desktop entry, icon, license
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/client-next/public/android-chrome-512x512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
