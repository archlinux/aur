# Maintainer: Nicolas Vyčas Nery <vycasnicolas@gmail.com>
pkgname=betasharp-git
pkgver=snapshot.pre1.0.6.r53.g288c93f8
pkgrel=1
pkgdesc="Enhanced recreation of Minecraft Beta 1.7.3 (launcher, client, server)"
arch=('x86_64')
url="https://git.gay/betasharp-official/betasharp"
license=('MIT')
depends=('dotnet-runtime' 'gtk3')
makedepends=('dotnet-sdk' 'git')
provides=('betasharp')
conflicts=('betasharp')
source=("$pkgname::git+https://git.gay/betasharp-official/betasharp.git#branch=main"
        "betasharp.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-g/.g/' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    dotnet publish BetaSharp.Launcher \
        --configuration Release \
        --runtime linux-x64 \
        --self-contained true \
        --output publish
}

package() {
    cd "$pkgname"

    install -dm755 "$pkgdir/usr/lib/betasharp"
    cp -r publish/. "$pkgdir/usr/lib/betasharp/"
    find "$pkgdir/usr/lib/betasharp" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/usr/lib/betasharp/BetaSharp.Launcher"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/betasharp" <<'EOF'
#!/bin/sh
cd /usr/lib/betasharp || exit 1
exec /usr/lib/betasharp/BetaSharp.Launcher "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/betasharp"

    install -Dm644 "$srcdir/betasharp.desktop" \
        "$pkgdir/usr/share/applications/betasharp.desktop"
    install -Dm644 BetaSharp.Launcher/logo.png \
        "$pkgdir/usr/share/pixmaps/betasharp.png"

    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
