# Maintainer: Art <fn3x@proton.me>
pkgname=sneemok
pkgver=0.3.6
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
source=("sneemok-0.3.6.tar.gz::https://codeberg.org/fn3x/sneemok/archive/v0.3.6.tar.gz")
sha256sums=('f27e4627d179d74dc26938e2b42ee4aae740a1b1b68d60c0d46a668a343edf3f')

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
    
    if [ -f LICENSE ]; then
      install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    if [ -f contrib/systemd/sneemok.service ]; then
      install -Dm644 contrib/systemd/sneemok.service \
          "$pkgdir/usr/lib/systemd/user/sneemok.service"
    fi
}
