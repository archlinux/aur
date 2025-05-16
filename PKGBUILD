# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=factorio-yafc-ce-git
pkgdesc="Yet Another Factorio Calculator (Community Edition): Powerful calculator/analyser that works with mods"
pkgver=2.13.0.2.g7039c41
pkgrel=1
arch=(x86_64)
url=https://github.com/have-fun-was-taken/yafc-ce
license=(GPL)
depends=(sdl2 sdl2_ttf sdl2_image dotnet-runtime)
makedepends=(git dotnet-sdk)
optdepends=()
provides=()
conflicts=()
options=()
source=($pkgname::git+https://github.com/have-fun-was-taken/yafc-ce.git
    factorio-yafc-ce.desktop factorio-yafc-ce icon.png)
sha256sums=('SKIP'
            'c6d364d63a902899367a46a91f353c57e19819c91173a6d9c685c2248f65131b'
            'c99b975dbca89bf970dec3b0af5e87a6dc38ec4c71e2f191c09cd3141e6c3176'
            '2aef2817ffcb8ff2448fd6942d7d7dd3dfa0a7a077427a3fca80c67b0ba20168')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

prepare() {
    cd "$srcdir/$pkgname/Yafc"
    DOTNET_CLI_TELEMETRY_OPTOUT=1 MSBUILDTERMINALLOGGER=off dotnet restore
}

build() {
    cd "$srcdir/$pkgname/Yafc"
    # workaround for https://github.com/shpaass/yafc-ce/issues/478
    DOTNET_CLI_TELEMETRY_OPTOUT=1 MSBUILDTERMINALLOGGER=off dotnet build ../Yafc.I18n.Generator

    DOTNET_CLI_TELEMETRY_OPTOUT=1 MSBUILDTERMINALLOGGER=off dotnet publish --use-current-runtime --self-contained false -o "../publish"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/publish" "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/factorio-yafc-ce" "$pkgdir/usr/bin/factorio-yafc-ce" # launch script adding --roll-forward Major to make it run on newer .NET versions
    install -Dm644 "$srcdir/factorio-yafc-ce.desktop" "$pkgdir"/usr/share/applications/factorio-yafc-ce.desktop
    install -Dm644 "$srcdir/icon.png" "$pkgdir"/usr/share/icons/hicolor/64x64/apps/yafc-ce.png
}

