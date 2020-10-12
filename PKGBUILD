# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
pkgname=kanshi-git
pkgver=r89.7095bed
pkgrel=1
pkgdesc="Dynamic output configuration for Wayland WMs"
arch=(x86_64)
url="https://github.com/emersion/kanshi"
license=('MIT')
groups=()
depends=('wayland')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wlroots>=0.7')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('kanshi::git+https://github.com/emersion/kanshi.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    # to shut up namcap's warning, even though it's a MIT license
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    # Arch's official Kanshi package installs README, so we do the same
    install -Dm644 "$srcdir/${pkgname%-git}/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
