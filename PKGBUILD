# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=1.3.0.r1.gc6446db
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/AnErrupTion/ly.git"
license=('custom:WTFPL')
depends=(pam)
makedepends=('zig>=0.14.0' git libxcb)
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
    zig build
}

package() {
    cd "$_pkgname"
    zig build installexe \
        -Ddest_directory="$pkgdir" \
        -Dname="ly-dm" \
        -Dinit_system=systemd

    install -DZ -m644 license.md "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}
