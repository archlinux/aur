# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=factorio-yafc-ce-git
pkgdesc="Yet Another Factorio Calculator (Community Edition): Powerful calculator/analyser that works with mods"
pkgver=0.6.0.8.g0aace81
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
    factorio-yafc-ce.desktop factorio-yafc-ce)
sha256sums=('SKIP'
            'e92f6355e68fe128f649a4d84aa3a79a8a8a6d1cbcdc593467fce374722c4106'
            'a943730e15f0914888c01cc20262931d0f5094bb5762f92f958f4f7cd3fe7840')

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
    dotnet publish --use-current-runtime --self-contained false -o "../publish"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/publish" "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/factorio-yafc-ce" "$pkgdir/usr/bin/factorio-yafc-ce" # launch script adding --roll-forward Major to make it run on newer .NET versions
    install -Dm644 "$srcdir/factorio-yafc-ce.desktop" "$pkgdir"/usr/share/applications/factorio-yafc-ce.desktop
}

