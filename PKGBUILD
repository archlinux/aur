# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=1.0.0.r173.g4345a99
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/AnErrupTion/ly.git"
license=('custom:WTFPL')
depends=(pam)
makedepends=('zig>=0.14.0' git libxcb)
optdepends=('xorg-xauth: for X server sessions')
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
    # NOTE: AFAICT `zig build` can't currently be used to correctly install these files in such an
    # environment, either the variables or the processes regarding file patching and file
    # installation need to be separated for it to work
    cd "$_pkgname"
    install -dZ "$pkgdir/etc/ly"
    install -DZ zig-out/bin/ly -T "$pkgdir"/usr/bin/ly-dm

    install -DZ res/config.ini -t "$pkgdir"/etc/ly
    sed -i 's;$DEFAULT_TTY;2;g' "$pkgdir"/etc/ly/config.ini
    sed -i 's;$CONFIG_DIRECTORY;/etc;g' "$pkgdir"/etc/ly/config.ini
    sed -i 's;$PREFIX_DIRECTORY;/usr;g' "$pkgdir"/etc/ly/config.ini

    install -DZ res/setup.sh -t "$pkgdir"/etc/ly
    sed -i 's;$CONFIG_DIRECTORY;/etc;g' "$pkgdir"/etc/ly/setup.sh

    install -dZ "$pkgdir"/etc/ly/lang
    install -DZ res/lang/* -t "$pkgdir"/etc/ly/lang
    install -DZ -m644 res/pam.d/ly -t "$pkgdir"/etc/pam.d

    install -dZ "$pkgdir"/usr/lib/systemd/system
    install -DZ -m644 res/ly.service -t "$pkgdir"/usr/lib/systemd/system
    sed -i 's;$DEFAULT_TTY;2;g' "$pkgdir"/usr/lib/systemd/system/ly.service
    sed -i 's;$CONFIG_DIRECTORY;/etc;g' "$pkgdir"/usr/lib/systemd/system/ly.service
    sed -i 's;$PREFIX_DIRECTORY;/usr;g' "$pkgdir"/usr/lib/systemd/system/ly.service
    sed -i 's;$EXECUTABLE_NAME;ly-dm;g' "$pkgdir"/usr/lib/systemd/system/ly.service

    install -DZ -m644 license.md -T "$pkgdir"/usr/share/licenses/"$pkgname"/WTFPL
}
