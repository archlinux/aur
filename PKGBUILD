# Maintainer: Steven Allen <steven@stebalien.com>
pkgname=localtime-git
pkgver=r30.d7ae38e
pkgrel=1
pkgdesc="Automatic Timezone Updater"
arch=('any')
url="https://github.com/Stebalien/localtime"
license=('GPL3')
depends=('dbus' 'geoclue2' 'systemd' 'polkit')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=localtime.install
source=("git+${url}.git" "localtime.install")
md5sums=('SKIP'
         '1ec88ae11d1801c5e398dbcacd605f63')

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
