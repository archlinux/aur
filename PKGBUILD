# Maintainer: Standa Lukeš <archpkg@exyi.cz>

pkgname=factorio-yafc-ce-git
pkgdesc="Yet Another Factorio Calculator (Community Edition): Powerful calculator/analyser that works with mods"
pkgver=v2.19.0.14.g8506d457
pkgrel=2
arch=(x86_64)
url=https://github.com/Yafc-CE/yafc-ce
license=(GPL)
depends=(sdl2 sdl2_ttf sdl2_image dotnet-runtime-10.0)
makedepends=(git dotnet-sdk-10.0 make gcc)
optdepends=()
provides=()
conflicts=()
options=()
_lua_version=5.2.1
source=($pkgname::git+https://github.com/Yafc-CE/yafc-ce.git
        factorio-yafc-ce.desktop factorio-yafc-ce icon.png
        https://www.lua.org/ftp/lua-$_lua_version.tar.gz)
sha256sums=('SKIP'
            'c6d364d63a902899367a46a91f353c57e19819c91173a6d9c685c2248f65131b'
            '8dea6d32f93f4210aab7863ac4e994e3c3b4d6d3873606ff96fc440fcf4329a3'
            '2aef2817ffcb8ff2448fd6942d7d7dd3dfa0a7a077427a3fca80c67b0ba20168'
            '64304da87976133196f9e4c15250b70f444467b6ed80d7cfd7b3b982b5177be5')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

prepare() {
    cd "$srcdir/$pkgname/Yafc"

    # remove pre-compiled binaries provided in the git repo, this is not a -bin package
    rm -rf lib

    DOTNET_CLI_TELEMETRY_OPTOUT=1 MSBUILDTERMINALLOGGER=off dotnet restore --locked-mode --use-current-runtime

    # YAFC needs patched lua version for factorio compatibility
    cd "$srcdir/lua-$_lua_version"

    patch -p1 -i "$srcdir/$pkgname/lua/liblua.so.patch"
    cd "src"
    patch -p1 -i "$srcdir/$pkgname/lua/lua-5.2.1.patch"
}

build() {
    cd "$srcdir/$pkgname/Yafc"

    DOTNET_CLI_TELEMETRY_OPTOUT=1 MSBUILDTERMINALLOGGER=off dotnet publish --no-self-contained --use-current-runtime -o "../publish"

    cd "$srcdir/lua-$_lua_version"

    make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux
    cp src/liblua.so "$srcdir/$pkgname/publish/liblua52.so"
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib"
    cp -a "$srcdir/$pkgname/publish" "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/factorio-yafc-ce" "$pkgdir/usr/bin/factorio-yafc-ce" # launch script adding --roll-forward Major to make it run on newer .NET versions
    install -Dm644 "$srcdir/factorio-yafc-ce.desktop" "$pkgdir"/usr/share/applications/factorio-yafc-ce.desktop
    install -Dm644 "$srcdir/icon.png" "$pkgdir"/usr/share/icons/hicolor/64x64/apps/yafc-ce.png
}

