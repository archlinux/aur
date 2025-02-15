# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=olympus
pkgver=25.02.08.04
_commit=e97ff0f5f2071ebd5a8864c5d2552c5d1f8001d3
pkgrel=1
pkgdesc='Everest installer / mod manager for Celeste'
arch=('x86_64')
url='https://github.com/EverestAPI/Olympus'
license=('MIT')
depends=('dotnet-runtime-8.0' 'gtk3' 'love' 'lua51-lsqlite3')
makedepends=('dotnet-sdk-8.0' 'git' 'lua51' 'luarocks')
conflicts=('olympus-bin')
source=("git+https://github.com/EverestAPI/Olympus.git#commit=$_commit"
        "git+https://github.com/EverestAPI/OlympUI.git"
        "git+https://github.com/vrld/moonshine.git"
        "git+https://github.com/LPGhatguy/luajit-request.git"
        "git+https://github.com/maddie480/lua-subprocess.git#commit=786303cd172bf8eb8f88c5998603875f3c33974c"
        "git+https://github.com/Vexatos/nativefiledialog.git#commit=bea4560b9269bdc142fef946ccd8682450748958")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/Olympus"

    git submodule init
    git config submodule.src/ui.url "$srcdir/OlympUI"
    git config submodule.src/moonshine.url "$srcdir/moonshine"
    git config submodule.src/luajit-request.url "$srcdir/luajit-request"
    git -c protocol.file.allow=always submodule update

    printf "%s" "$pkgver" > src/version.txt
}

build() {
    cd "$srcdir/Olympus"

    dotnet build --configuration Release sharp/Olympus.Sharp.sln
    dotnet publish --configuration Release sharp/Olympus.Sharp.sln --output sharp/publish

    cd "$srcdir/lua-subprocess"; luarocks make --lua-version=5.1 --tree="$srcdir/Olympus/luarocks" --deps-mode=none --no-manifest subprocess-scm-1.rockspec
    cd "$srcdir/nativefiledialog"; luarocks make --lua-version=5.1 --tree="$srcdir/Olympus/luarocks" --deps-mode=none --no-manifest lua/nfd-scm-1.rockspec \
        LUA_LIBDIR=/usr/lib # nfd requires this env variable since it (incorrectly?) uses it for -L and it isn't set by default by luarocks
}

package() {
    cd "$srcdir/Olympus"

    mkdir -p "$pkgdir/usr/lib/olympus"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/olympus/olympus "$pkgdir/usr/bin/olympus"
    install -Dm755 olympus.sh "$pkgdir/usr/lib/olympus/olympus"
    install -Dm755 find-love.sh "$pkgdir/usr/lib/olympus/find-love"

    bsdtar --format zip --strip-components 1 -cf "$pkgdir/usr/lib/olympus/olympus.love" src

    install -Dm755 luarocks/lib/lua/5.1/* -t "$pkgdir/usr/lib/olympus"
    cp -dr --no-preserve='ownership' sharp/publish "$pkgdir/usr/lib/olympus/sharp"

    install -Dm644 lib-linux/olympus.desktop "$pkgdir/usr/share/applications/olympus.desktop"
    install -Dm644 src/data/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/olympus.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
