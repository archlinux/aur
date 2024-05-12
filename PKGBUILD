# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=0.6.0.r9.g7506d6a
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://github.com/fairyglade/$_pkgname"
license=('custom:WTFPL')
depends=(pam)
makedepends=(zig git libxcb)
optdepends=('xorg-xauth: for X server sessions')
conflicts=(ly)
provides=(ly)
backup=(etc/"$_pkgname"/{config.ini,wsetup.sh,xsetup.sh})
source=("git+$url.git")
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
    install -dZ "$pkgdir/etc/ly"
    install -DZ zig-out/bin/ly -T "$pkgdir"/usr/bin/ly-dm
    install -DZ res/config.ini -t "$pkgdir"/etc/ly
    install -DZ res/xsetup.sh -t "$pkgdir"/etc/ly
    install -DZ res/wsetup.sh -t "$pkgdir"/etc/ly
    install -dZ "$pkgdir"/etc/ly/lang
    install -DZ res/lang/* -t "$pkgdir"/etc/ly/lang
    install -DZ -m644 res/pam.d/ly -t "$pkgdir"/etc/pam.d

    install -dZ "$pkgdir"/usr/lib/systemd/system
    install -DZ -m644 res/ly.service -t "$pkgdir"/usr/lib/systemd/system
    sed -i 's;/usr/bin/ly;/usr/bin/ly-dm;g' "$pkgdir"/usr/lib/systemd/system/ly.service
    install -DZ -m644 license.md -T "$pkgdir"/usr/share/licenses/"$pkgname"/WTFPL
}
