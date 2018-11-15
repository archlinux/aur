# Maintainer: Ainola
# Maintainer: Thorsten Töpper (Official Arch Package)

pkgname=i3lock-media-keys
pkgver=2.11.1
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM. Patched for media control support"
arch=('x86_64')
url="https://i3wm.org/i3lock/"
license=('MIT')
groups=("i3")
depends=('xcb-util-image' 'xcb-util-xrm' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
conflicts=('i3lock')
provides=("i3lock=$pkgver")
backup=("etc/pam.d/i3lock")
install="$pkgname.install"
source=("https://i3wm.org/i3lock/i3lock-$pkgver.tar.bz2"
        "https://i3wm.org/i3lock/i3lock-$pkgver.tar.bz2.asc"
        "allow_media_keys.patch")
sha256sums=('f2a8c3d8827529e1dbb2ca870b0b27592c741356fb32dbf0969d9d4a46b1ad04'
            'SKIP'
            '077d3fd09a3f32e8aa13d9a7d5639e8e6112938287e185653d23ac674f3d92ec')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg

prepare() {
    # Allow media keys to be passed through to the desktop even when locked.
    # NOTE: Ensure that your media keys are not bound to something potentially
    # harmful. See https://github.com/i3/i3lock/issues/52

    # This patch was written by Johannes Frankenau (with a few updates applied
    # as it was for an older version of i3lock):
    # https://github.com/i3/i3lock/commit/4d85b886fc16376c85c9ea444ca6b9c0a65cccc5
    patch -d i3lock-"$pkgver" -p1 < allow_media_keys.patch

    # Fix ticket FS#31544, sed line taken from gentoo
    sed -i -e 's:login:system-auth:' "i3lock-$pkgver/pam/i3lock"
}

build() {
    cd "i3lock-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "i3lock-$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
