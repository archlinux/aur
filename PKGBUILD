# Maintainer: aydiler <aydiler@users.noreply.github.com>
pkgname=kb-layout-daemon-git
pkgver=0.1.0.r0.gba28b4b
pkgrel=1
pkgdesc="Auto-switch keyboard layout based on which physical keyboard is used (KDE/Linux)"
arch=('x86_64')
url="https://github.com/aydiler/kb-layout-daemon"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('kb-layout-daemon')
conflicts=('kb-layout-daemon')
source=("git+https://github.com/aydiler/kb-layout-daemon.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/kb-layout-daemon"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/kb-layout-daemon"
    cargo build --release --locked
}

package() {
    cd "$srcdir/kb-layout-daemon"
    install -Dm755 "target/release/kb-layout-daemon" "$pkgdir/usr/bin/kb-layout-daemon"
    install -Dm644 "kb-layout-daemon.service" "$pkgdir/usr/lib/systemd/user/kb-layout-daemon.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
