# Maintainer: Dan Printzell <me@vild.io>

pkgname=('serve-d-git')
pkgver=r911.172f231
pkgrel=2
pkgdesc="Microsoft language server protocol implementation for D using workspace-d"
arch=('i686' 'x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('ldc' 'lld' 'clang' 'git' 'dub' 'dtools')
depends=('libphobos' 'dub' 'dcd' 'dfmt' 'dscanner')
provides=('serve-d')
conflicts=('serve-d')

source=(
    "git+https://github.com/Pure-D/serve-d"
    "git+https://github.com/ljmf00/dlang-requests#branch=support-3.1"
    "dub.selections.json"
)
sha256sums=('SKIP'
            'SKIP'
            '44544b5310231f761e4457be3d8d00c82eceeab3ba6bfe8a11674247e688b712')

prepare() {
    cd "$srcdir/dlang-requests"
    dub add-local "$PWD" ~support-3.1

    cd "$srcdir/serve-d"
    cp ../dub.selections.json .

    dub fetch dscanner@~master
    dub upgrade -s --missing-only
}

pkgver() {
    cd "$srcdir/serve-d"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/serve-d"
    DFLAGS="--release --boundscheck=off -O3 --linker=lld --gcc=clang --flto=full --link-defaultlib-shared=false -L--build-id" dub build --compiler=ldc
}

package() {
    # binaries
    install -Dm755 "$srcdir/serve-d/serve-d" "$pkgdir/usr/bin/serve-d"

    # license
    install -Dm644 "$srcdir/serve-d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
