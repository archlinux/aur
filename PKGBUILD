# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: gilbus

pkgname=swaylock
pkgver=1.6
pkgrel=1
license=("MIT")
pkgdesc="Screen locker for Wayland"
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
    'git'  # To make the version string
)
depends=(
    'cairo'
    'libxkbcommon'
    'pam'
    'wayland'
    'gdk-pixbuf2'  # For images other than PNG
)
arch=('x86_64')
url="https://github.com/swaywm/swaylock"
options=(debug)
backup=('etc/pam.d/swaylock')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaylock/archive/$pkgver.tar.gz"
    "https://github.com/swaywm/swaylock/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=('b9181e15d8166bba3a29dabb392cfe94568e4ceb358d388a812cd28c3f61bbe3'
            'SKIP')
validpgpkeys=(
    "9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"  # Drew DeVault
    "34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48"  # Simon Ser
)

build() {
    meson "$pkgname-$pkgver" build \
        --prefix /usr \
        --buildtype=plain
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
