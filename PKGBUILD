# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname=cage-mao-git
pkgver=r354.a9584a1
pkgrel=1
pkgdesc="Kiosk compositor for Wayland with gamma and numlock support"
depends=(glibc wayland wlroots-0.18-git libxkbcommon)
makedepends=(git meson scdoc wayland-protocols xorg-server-xwayland)
optdepends=(
    'polkit: System privilege control. Required if not using seatd service'
    'xorg-server-xwayland: X11 support'
)
arch=(x86_64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
provides=(cage)
conflicts=(cage cage-git)
source=("${pkgname}::git+https://github.com/DreamMaoMao/cage.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    # export PKG_CONFIG_PATH="/usr/lib/wlroots0.17/pkgconfig/"
    meson setup --buildtype=release --prefix /usr "$srcdir/build"
    ninja -C "$srcdir/build"
}

check() {
    ninja -C "$srcdir/build" test
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" meson install -C "$srcdir/build"
    install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
