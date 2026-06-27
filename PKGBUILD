# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgbase=hilbish

pkgname=(
    "$_pkgbase-git"
    "$_pkgbase-midnight-git"
)

pkgver=2.3.4.r132.g6cd7cd3d
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/$_pkgbase"
license=('MIT')

makedepends=('git' 'go')

install=hilbish.install

source=("$_pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    git describe --long --tags | sed 's/^v//;s/-rc/.rc/;s/-/.r/;s/-/./'
}

prepare() {
    cd "$srcdir/$_pkgbase"
    go mod download
}

build() {
    cd "$srcdir/$_pkgbase"

    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

    # standard
    go build \
        -o "$srcdir/$_pkgbase-standard" \
    -ldflags="-linkmode=external \
            -X main.dataDir=/usr/share/hilbish \
            -X main.version=$pkgver"

    # midnight lua5.4
    go build \
        -o "$srcdir/$_pkgbase-midnight" \
        -tags "midnight,lua54" \
    -ldflags="-linkmode=external \
            -X main.dataDir=/usr/share/hilbish \
            -X main.version=$pkgver"
}

_package_common() {
    install -Dm644 "$srcdir/$_pkgbase/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgbase/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "$srcdir/$_pkgbase/.hilbishrc.lua" \
        "$pkgdir/usr/share/hilbish/.hilbishrc.lua"

    cp -a --no-preserve=ownership \
        "$srcdir/$_pkgbase/nature" \
        "$pkgdir/usr/share/hilbish/"

    mkdir -p "$pkgdir/usr/share/hilbish/libs"

    cp -a --no-preserve=ownership \
        "$srcdir/$_pkgbase/libs/ansikit" \
        "$pkgdir/usr/share/hilbish/libs/"
}

package_hilbish-git() {
    pkgdesc="The flower shell for Lua users (Standard edition)"

    depends=(
        'lua-lunacolors'
        'lua-succulent'
        'lua-inspect'
    )

    provides=('hilbish')
    conflicts=('hilbish' 'hilbish-midnight-git')

    install -Dm755 \
        "$srcdir/$_pkgbase-standard" \
        "$pkgdir/usr/bin/hilbish"

    _package_common
}

package_hilbish-midnight-git() {
    pkgdesc="The flower shell for Lua users (Midnight edition)"

    depends=(
        'lua54'
        'lua-lunacolors'
        'lua-succulent'
        'lua-inspect'
    )

    provides=('hilbish')
    conflicts=('hilbish' 'hilbish-git')

    install -Dm755 \
        "$srcdir/$_pkgbase-midnight" \
        "$pkgdir/usr/bin/hilbish"

    _package_common
}
