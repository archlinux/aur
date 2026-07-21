# Maintainer: Nicolas Vyčas Nery <vycasnicolas@gmail.com>
pkgname=betasharp-git
pkgver=snapshot.pre1.0.6.r53.g288c93f8
pkgrel=2
pkgdesc="Enhanced recreation of Minecraft Beta 1.7.3 (launcher, client, server)"
arch=('x86_64')
url="https://git.gay/betasharp-official/betasharp"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
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
    chmod 755 "$pkgdir/usr/lib/betasharp/Client/BetaSharp.Client"
    chmod 755 "$pkgdir/usr/lib/betasharp/Server/BetaSharp.Server"

    # Launcher writes the downloaded game jar next to its own binary
    # (AppContext.BaseDirectory/Client|Server), which is read-only under
    # /usr/lib. Stage a per-user writable copy in XDG_DATA_HOME and run
    # from there instead; re-stage whenever the installed version changes.
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/betasharp" <<EOF
#!/bin/sh
set -e
PKGVER="$pkgver-$pkgrel"
DEST="\${XDG_DATA_HOME:-\$HOME/.local/share}/betasharp"
STAMP="\$DEST/.installed-version"
if [ ! -f "\$STAMP" ] || [ "\$(cat "\$STAMP")" != "\$PKGVER" ]; then
    mkdir -p "\$DEST"
    cp -rf /usr/lib/betasharp/. "\$DEST/"
    echo "\$PKGVER" > "\$STAMP"
fi
cd "\$DEST"
exec "\$DEST/BetaSharp.Launcher" "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/betasharp"

    install -Dm644 "$srcdir/betasharp.desktop" \
        "$pkgdir/usr/share/applications/betasharp.desktop"
    install -Dm644 BetaSharp.Launcher/logo.png \
        "$pkgdir/usr/share/pixmaps/betasharp.png"

    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
