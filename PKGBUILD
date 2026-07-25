# Maintainer: realstrawhat <realstrawhat@users.noreply.github.com>

pkgname=csakura-git
_pkgname=csakura
pkgver=2.0.0.r0.g151ddb9
pkgrel=1
pkgdesc="A sakura tree with falling petals for your terminal (cmatrix-style) - git build"
arch=('x86_64' 'aarch64')
url="https://github.com/realstrawhat/csakura"
license=('MIT')
depends=('ncurses')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Prefer the tag; a pipeline's exit status is sed's, so the fallback has to
    # be guarded on git describe itself rather than chained with ||.
    local tag
    if tag=$(git describe --long --abbrev=7 --tags 2>/dev/null); then
        printf '%s' "$tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
