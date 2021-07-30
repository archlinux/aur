# Maintainer: Lorenzo Debertolis <as3ii@gmail.com>
pkgname=emptty-git
pkgver=0.6.0.r0.f0ff64c
pkgrel=1
pkgdesc="Dead simple CLI Display Manager on TTY"
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('git' 'go')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/emptty/conf')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --long $(git rev-list --all --max-count=1) \
        | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install-all
    make DESTDIR="$pkgdir/" install-config
    make DESTDIR="$pkgdir/" install-systemd
    printf "disable your DM and run 'systemctl enable emptty' to enable emptty at the next boot\n"
}
