# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile-git
_pkgname=stacktile
pkgver=r52.8f06de2
pkgrel=1
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git' 'wayland')
conflicts=('stacktile')
provides=('stacktile')
options=('!buildflags')
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
    git config "submodule.deps/zig-wayland.url" "$srcdir/zig-wayland"
    git submodule update
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" zig build -Drelease-safe --prefix "/usr" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README -t "$pkgdir/usr/share/doc/$_pkgname"
}
