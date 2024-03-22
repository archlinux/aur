# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=factorio-yafc-ce-git
pkgdesc="Yet Another Factorio Calculator (Community Edition): Powerful calculator/analyser that works with mods"
pkgver=0.6.1.107.g1868912
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
            'fd5d3035e37cc26ebe6ae41fa8b77fe7d1839bc0eda4f5a2ec5622a013a100cc'
            'a943730e15f0914888c01cc20262931d0f5094bb5762f92f958f4f7cd3fe7840'
            '2aef2817ffcb8ff2448fd6942d7d7dd3dfa0a7a077427a3fca80c67b0ba20168')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

prepare() {
    cd "$srcdir/$pkgname/YAFC"
    DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet restore
}

build() {
    cd "$srcdir/$pkgname/YAFC"
    DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish --use-current-runtime --self-contained false -o "../publish"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/publish" "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/factorio-yafc-ce" "$pkgdir/usr/bin/factorio-yafc-ce" # launch script adding --roll-forward Major to make it run on newer .NET versions
    install -Dm644 "$srcdir/factorio-yafc-ce.desktop" "$pkgdir"/usr/share/applications/factorio-yafc-ce.desktop
    install -Dm644 "$srcdir/icon.png" "$pkgdir"/usr/share/icons/hicolor/64x64/apps/yafc-ce.png
}

