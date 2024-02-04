# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
pkgname=kanshi-git
pkgver=1.5.1.r6.g0602cd3
pkgrel=1
pkgdesc="Dynamic output configuration for Wayland WMs"
arch=(x86_64)
url="https://git.sr.ht/~emersion/kanshi"
license=('MIT')
groups=()
depends=('wayland' 'libvarlink' 'libscfg')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wlroots>=0.7')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
    'kanshi::git+https://git.sr.ht/~emersion/kanshi'
    'kanshi.service'
)
noextract=()
md5sums=('SKIP' '204747a0d0e0dd77d0e4f88f229c9c28')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # arch-meson automatically sets prefix and other options
    arch-meson --buildtype=release "${srcdir}/build" "${srcdir}/${pkgname%-git}"
    # compile
    meson compile -C "${srcdir}/build" -j 0 --verbose
}

package() {
    # install to $pkgdir
    DESTDIR="$pkgdir/" meson install -C "${srcdir}/build"
    # install the systemd unit file
    install -Dm644 kanshi.service -t "$pkgdir/usr/lib/systemd/user"
    # to shut up namcap's warning, even though it's a MIT license
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    # Arch's official Kanshi package installs README, so we do the same
    install -Dm644 "$srcdir/${pkgname%-git}/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
