# Maintainer: justanoobcoder <syaorancode@gmail.com>
pkgname=wayshadow-git
_pkgname=wayshadow
pkgver=r33.31e440b
pkgrel=1
pkgdesc="A lightweight, elegant keystroke visualizer for Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/justanoobcoder/wayshadow"
license=('MIT')
depends=(
    'wayland'
    'cairo'
    'pango'
    'libinput'
    'libxkbcommon'
    'gtk3'
    'libappindicator'
)
makedepends=(
    'wayland-protocols'
    'pkg-config'
    'gcc'
    'make'
    'git'
)
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    make WAYLAND_PROTOCOLS_DIR=/usr/share/wayland-protocols \
	GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)
}

check() {
    cd "$_pkgname"
    make test WAYLAND_PROTOCOLS_DIR=/usr/share/wayland-protocols
}

package() {
    cd "$_pkgname"
    make install \
         DESTDIR="$pkgdir" \
         WAYLAND_PROTOCOLS_DIR=/usr/share/wayland-protocols

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
