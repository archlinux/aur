# Maintainer: Steven Allen <steven@stebalien.com>
pkgname=localtime-git
pkgver=r37.10b6c51
pkgrel=1
pkgdesc="Automatic Timezone Updater"
arch=('any')
url="http://stebalien.com/projects/localtime/"
license=('GPL3')
depends=('dbus' 'geoclue2' 'systemd>=232-7' 'polkit')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Stebalien/localtime.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    make PREFIX=/usr DESTDIR="$pkgdir" 
}

package() {
	cd "$srcdir/${pkgname%-git}"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    # Fix permissions
    chmod -R u=rwX,g=rX,o=- "$pkgdir/usr/share/polkit-1/rules.d/"
    chgrp -R polkitd "$pkgdir/usr/share/polkit-1/rules.d/"
}
