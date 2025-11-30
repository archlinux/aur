# Maintainer: Art <fn3x@proton.me>
pkgname=sneemok
pkgver=0.3.4
pkgrel=1
pkgdesc="Wayland screenshot annotation tool with clipboard support"
arch=('x86_64')
url="https://codeberg.org/fn3x/sneemok"
license=('MIT')
depends=(
    'wayland'
    'cairo'
    'dbus'
    'wlroots0.19'
)
makedepends=(
    'zig'
    'wayland-protocols'
    'git'
)
optdepends=(
    'xdg-desktop-portal: Screenshot capture support'
    'xdg-desktop-portal-hyprland: For Hyprland users'
    'xdg-desktop-portal-wlr: For wlroots-based compositors'
)
source=("sneemok-0.3.4.tar.gz::https://codeberg.org/fn3x/sneemok/archive/v0.3.4.tar.gz")
sha256sums=('52ff0d555ecd354e0f1802273a933e6f557ec8c84da404b573b883f7bdd42879')

build() {
    cd "$srcdir/$pkgname"
    
    zig build -Doptimize=ReleaseSafe
}

check() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"
    
    export HOME="$srcdir"
    DESTDIR="$pkgdir" zig build install -Doptimize=ReleaseSafe --prefix /usr
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    if [ -f contrib/systemd/sneemok.service ]; then
      install -Dm644 contrib/systemd/sneemok.service \
          "$pkgdir/usr/lib/systemd/user/sneemok.service"
    fi
}
