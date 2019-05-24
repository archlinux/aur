# Maintainer: Jon Gjengset
pkgname=perflock-git
pkgver=r7.eaf54d0
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
         'c2ca7dd3883d996d0bbb1638f5e7f041')

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
