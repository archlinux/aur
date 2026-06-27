# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

pkgbase=hilbish-git
pkgname=(
    hilbish-git
    hilbish-midnight-git
)

pkgver=2.3.4.r132.g6cd7cd3d
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')

makedepends=('git' 'go')

install=hilbish.install

source=("hilbish::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd hilbish
    git describe --long --tags | sed 's/^v//;s/-rc/.rc/;s/-/.r/;s/-/./'
}

prepare() {
    cd hilbish
    go mod download
}

build() {
    cd hilbish

    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

    # ========= STANDARD =========
    go build \
    -ldflags="-linkmode=external \
		-X main.dataDir=/usr/share/hilbish \
		-X main.version=$pkgver"

    mv hilbish "$srcdir/hilbish-standard"

    # ========= MIDNIGHT =========
    go build \
        -tags "midnight,lua54" \
    -ldflags="-linkmode=external \
		-X main.dataDir=/usr/share/hilbish \
		-X main.version=$pkgver"

    mv hilbish "$srcdir/hilbish-midnight"
}

_package_common() {
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 .hilbishrc.lua \
        "$pkgdir/usr/share/hilbish/.hilbishrc.lua"

    cp -a --no-preserve=ownership \
        nature \
        "$pkgdir/usr/share/hilbish/"

    mkdir -p "$pkgdir/usr/share/hilbish/libs"

    cp -a --no-preserve=ownership \
        libs/ansikit \
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
    conflicts=(
        'hilbish'
        'hilbish-midnight-git'
    )

    cd hilbish

    install -Dm755 \
        "$srcdir/hilbish-standard" \
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
    conflicts=(
        'hilbish'
        'hilbish-git'
    )

    cd hilbish

    install -Dm755 \
        "$srcdir/hilbish-midnight" \
        "$pkgdir/usr/bin/hilbish"

    _package_common
}
