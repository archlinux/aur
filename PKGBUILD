# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=olympus-git
pkgver=r650.e9bf1d8
pkgrel=2
pkgdesc='Everest installer / mod manager for Celeste (git)'
arch=('x86_64')
url='https://github.com/EverestAPI/Olympus'
license=('MIT')
depends=('gtk3' 'love' 'lua51-lsqlite3' 'mono')
makedepends=('git' 'lua51' 'luarocks' 'msbuild' 'nuget' 'zip')
provides=('olympus')
conflicts=('olympus' 'olympus-bin')
source=("git+https://github.com/EverestAPI/Olympus.git"
        "git+https://github.com/EverestAPI/OlympUI.git"
        "git+https://github.com/vrld/moonshine.git"
        "git+https://github.com/LPGhatguy/luajit-request.git"
        "git+https://github.com/0x0ade/lua-subprocess.git"
        "git+https://github.com/Vexatos/nativefiledialog.git"
        "use-system-mono.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1949929334222f20ae01930041d05cfefa7d48698573c2d2bbda09195d43ae0f')

pkgver() {
    cd "$srcdir/Olympus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Olympus"

    patch -p1 < "$srcdir/use-system-mono.patch"

    git submodule init
    git config submodule.src/ui.url "$srcdir/OlympUI"
    git config submodule.src/moonshine.url "$srcdir/moonshine"
    git config submodule.src/luajit-request.url "$srcdir/luajit-request"
    git -c protocol.file.allow=always submodule update

    nuget restore sharp/Olympus.Sharp.sln

    printf "%s" "$pkgver" > src/version.txt
}

build() {
    cd "$srcdir/Olympus"

    FrameworkPathOverride=/usr/lib/mono/4.5 msbuild sharp/Olympus.Sharp.sln /p:Configuration=Release

    cd "$srcdir/lua-subprocess"; luarocks make --lua-version=5.1 --tree="$srcdir/Olympus/luarocks" --deps-mode=none --no-manifest subprocess-scm-1.rockspec
    cd "$srcdir/nativefiledialog"; luarocks make --lua-version=5.1 --tree="$srcdir/Olympus/luarocks" --deps-mode=none --no-manifest lua/nfd-scm-1.rockspec \
        LUA_LIBDIR=/usr/lib # nfd requires this env variable since it (incorrectly?) uses it for -L and it isn't set by default by luarocks
}

package() {
    cd "$srcdir/Olympus"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/olympus/olympus "$pkgdir/usr/bin/olympus"
    install -Dm755 olympus.sh "$pkgdir/usr/lib/olympus/olympus"

    cd src; zip -r ../olympus.love *; cd ..
    install -Dm644 olympus.love "$pkgdir/usr/lib/olympus/olympus.love"

    install -Dm755 luarocks/lib/lua/5.1/* -t "$pkgdir/usr/lib/olympus"
    install -Dm755 sharp/bin/Release/net452/* -t "$pkgdir/usr/lib/olympus/sharp"

    install -Dm644 lib-linux/olympus.desktop "$pkgdir/usr/share/applications/olympus.desktop"
    install -Dm644 src/data/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/olympus.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
