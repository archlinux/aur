# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=olympus-git
pkgver=r916.7f7660b
pkgrel=1
pkgdesc='Everest installer / mod manager for Celeste (git)'
arch=('x86_64')
url='https://github.com/EverestAPI/Olympus'
license=('MIT')
depends=('dotnet-runtime-8.0' 'gtk3' 'love' 'lua51-lsqlite3')
makedepends=('dotnet-sdk-8.0' 'git' 'lua51' 'luarocks')
provides=('olympus')
conflicts=('olympus' 'olympus-bin')
source=("git+https://github.com/EverestAPI/Olympus.git"
        "git+https://github.com/EverestAPI/OlympUI.git"
        "git+https://github.com/vrld/moonshine.git"
        "git+https://github.com/LPGhatguy/luajit-request.git"
        "git+https://github.com/maddie480/lua-subprocess.git"
        "git+https://github.com/Vexatos/nativefiledialog.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/Olympus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
    install -Dm755 suppress-output.sh "$pkgdir/usr/lib/olympus/suppress-output"

    bsdtar --format zip --strip-components 1 -cf "$pkgdir/usr/lib/olympus/olympus.love" src

    install -Dm755 luarocks/lib/lua/5.1/* -t "$pkgdir/usr/lib/olympus"
    cp -dr --no-preserve='ownership' sharp/publish "$pkgdir/usr/lib/olympus/sharp"

    install -Dm644 lib-linux/olympus.desktop "$pkgdir/usr/share/applications/olympus.desktop"
    install -Dm644 src/data/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/olympus.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
