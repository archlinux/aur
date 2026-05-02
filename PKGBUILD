# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=1.4.0.r6.g864f5f2
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/fairyglade/ly.git"
license=('WTFPL')
depends=(pam)
makedepends=('zig>=0.16' 'zig<0.17' git libxcb)
optdepends=('xorg-xauth: for X server sessions' 'durdraw: for animations')
conflicts=(ly)
provides=(ly)
backup=(etc/"$_pkgname"/{config.ini,setup.sh})
source=("git+$url")

md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    zig build \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache" \
        -Doptimize=ReleaseSafe
}

package() {
    cd "$_pkgname"
    zig build installexe \
        --cache-dir "$srcdir/zig-cache" \
        --global-cache-dir "$srcdir/zig-global-cache" \
        -Ddest_directory="$pkgdir" \
        -Dname="ly-dm" \
        -Dinit_system=systemd

    install -DZ -m644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}
