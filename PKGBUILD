# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile-git
_pkgname=stacktile
pkgver=r54.3a371f8
pkgrel=1
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git' 'zig' 'wayland')
conflicts=('stacktile')
provides=('stacktile')
source=(
    "git+https://git.sr.ht/~leon_plickat/stacktile"
    "git+https://github.com/ifreund/zig-wayland.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule init
    git config submodule.externals/vendor/zig-wayland.url "$srcdir/zig-wayland"
    git -c protocol.file.allow=always submodule update
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" zig build -Drelease-safe --prefix "/usr" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README -t "$pkgdir/usr/share/doc/$_pkgname"
}
