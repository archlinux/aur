# Maintainer: Timothy Beach <beachtimothyd@gmail.com>

pkgname=ttt-aegix-git
_pkgname=ttt
pkgver=r3.08ff984
pkgrel=1
pkgdesc="Aegix Linux's terminal Time Timer: a visual countdown dial for ADHD time blindness, with a screen flash and alarm at zero"
arch=('x86_64')
url="https://github.com/aegixlinux/ttt"
license=('MIT')
depends=('libx11')
makedepends=('git')
optdepends=('sound-theme-freedesktop: alarm sound for the default alarm command'
            'pipewire: pw-play used by the default alarm command')
provides=('ttt')
conflicts=('ttt')
source=("$_pkgname::git+https://github.com/aegixlinux/ttt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    # ttt's Makefile hardcodes PREFIX; patch it to /usr for arch packaging.
    sed -i 's|^PREFIX = /usr/local|PREFIX = /usr|' Makefile
}

build() {
    cd "$_pkgname"
    make
}

check() {
    cd "$_pkgname"
    make test
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
