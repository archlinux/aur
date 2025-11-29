# Maintainer: Art <fn3x@proton.me>
pkgname=sneemok
pkgver=0.2.5
pkgrel=1
pkgdesc="Wayland screenshot annotation tool with clipboard support"
arch=('x86_64')
url="https://codeberg.org/fn3x/sneemok"
license=('MIT')
depends=(
    'wayland'
    'cairo'
    'dbus'
    'libxkbcommon'
    'wl-clipboard'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('02226f73b19152d65c4ddc60dc88a6b06b62f2f06d7519e18bd42604fca2cfa7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    export HOME="$srcdir"
    zig build -Doptimize=ReleaseSafe --prefix /usr
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    DESTDIR="$pkgdir" zig build install -Doptimize=ReleaseSafe --prefix /usr
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install systemd user service (optional)
    install -Dm644 contrib/systemd/sneemok.service \
        "$pkgdir/usr/lib/systemd/user/sneemok.service"
}
