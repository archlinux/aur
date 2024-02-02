# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=factorio-yafc-git
pkgdesc="Yet Another Factorio Calculator: Powerful calculator/analyser that works with mods"
pkgver=v0.5.8.51.gfd80865
pkgrel=1
arch=(x86_64)
url=https://github.com/ShadowTheAge/yafc
license=(GPL)
depends=(sdl2 sdl2_ttf sdl2_image dotnet-runtime)
makedepends=(git dotnet-sdk)
optdepends=()
provides=()
conflicts=()
options=()
source=($pkgname::git+https://github.com/ShadowTheAge/yafc.git
    factorio-yafc.desktop factorio-yafc)
sha256sums=('SKIP'
            'f4d87b77fd861031300921d1405dfd475b492a7214e4b3016f9788ed1c822ec0'
            '755616cb54c512258f606cd2bbe3e267b1aa4dedcc694549044038776b03d827')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

prepare() {
    cd "$srcdir/$pkgname/YAFC"
    dotnet restore
}

build() {
    cd "$srcdir/$pkgname/YAFC"
    DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish --use-current-runtime --self-contained false -o "../publish"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/publish" "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/factorio-yafc" "$pkgdir/usr/bin/factorio-yafc" # launch script adding --roll-forward Major to make it run on newer .NET versions
    install -Dm644 "$srcdir/factorio-yafc.desktop" "$pkgdir"/usr/share/applications/factorio-yafc.desktop
}

