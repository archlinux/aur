# Maintainer: Jon Gjengset
pkgname=perflock-git
pkgver=r7.7650760
pkgrel=1
pkgdesc="RWMutex for sharing of multicore machines"
arch=('any')
url="https://github.com/mit-pdos/perflock"
license=('MIT')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mit-pdos/perflock.git' 'perflock.tmpfiles')
md5sums=('SKIP'
         'b9b34e13088f9f50e86206e1ae23fbe7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	gcc -o wholock wholock.c
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	chmod u+s wholock
	mv wholock "$pkgdir/usr/bin"
	cp perflock pl pls "$pkgdir/usr/bin"
	install -Dm 644 "$srcdir"/perflock.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/perflock.conf"
}
