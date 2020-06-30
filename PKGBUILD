# Maintainer: Lorenzo Debertolis <as3ii@gmail.com>
pkgname=emptty-git
_name=emptty
pkgver=0.2.0.r9.g78966f3
pkgrel=1
pkgdesc="Dead simple Display Manager running in CLI as TTY login, that starts Xorg or Wayland"
arch=(x86_64)
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=(pam)
makedepends=(git go make pam)
optdepends=('xorg-server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: (mcookie) required if using xorg-server'
            'wayland: alternative to xorg-server')
provides=("emptty")
backup=('etc/emptty/conf')
source=("git+${url}.git")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$_name"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"
	make build
}

package() {
	cd "$srcdir/$_name"
	install -DZs "dist/$_name" -m 755 -t "$pkgdir/usr/bin"
    install -DZ res/conf -m 755 -T "$pkgdir/etc/$_name/conf"
    install -D "dist/$_name.1.gz" -t "$pkgdir/usr/share/man/man1"
    install -DZ res/pam -m 644 -T "$pkgdir/etc/pam.d/$_name"
    install -DZ res/systemd-service -m 755 -T "$pkgdir/usr/lib/systemd/system/$_name.service"
    printf "disable your DM and run 'systemctl enable emptty' to enable emptty at the next boot\n"
}
