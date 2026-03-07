# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=lovr-playspace-git
pkgver=r32.c37f4e5
pkgrel=1
pkgdesc="Room boundary overlay for OpenXR, made with LÖVR"
arch=('any')
url="https://github.com/SpookySkeletons/lovr-playspace"
license=('MIT')
depends=('lovr' 'bash' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('envision: automatic plugin integration')
provides=('lovr-playspace')
conflicts=('lovr-playspace')
source=(
    "$pkgname::git+https://github.com/SpookySkeletons/lovr-playspace.git"
    "json::git+https://github.com/rxi/json.lua.git"
    "lovr-playspace.desktop"
    "lovr-playspace.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'ae3e2566417009e6dfd825785d88d33f6c02b9a7070f8c5bad8d58d83e3be3e9'
    '2754606a7f734f8bf18c6041c5d32ea3c038dbaebbb488fc67e8da6b26dcf993'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.json.lua.url "$srcdir/json"
    git -c protocol.file.allow=always submodule update
}

package() {
    cd "$pkgname"

    # Lua sources
    install -dm755 "$pkgdir/usr/share/lovr-playspace"
    install -m644 conf.lua main.lua "$pkgdir/usr/share/lovr-playspace/"
    install -dm755 "$pkgdir/usr/share/lovr-playspace/json"
    install -m644 json/json.lua "$pkgdir/usr/share/lovr-playspace/json/"

    # Wrapper
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/lovr-playspace" << 'EOF'
#!/bin/bash
exec lovr /usr/share/lovr-playspace "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/lovr-playspace"

    # Desktop entry
    install -Dm644 "$srcdir/lovr-playspace.desktop" \
        "$pkgdir/usr/share/applications/lovr-playspace.desktop"

    # Icon
    install -Dm644 "$srcdir/lovr-playspace.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lovr-playspace.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
