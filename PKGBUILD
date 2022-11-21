# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=rp-bookshelf
pkgver=r124.7a742e3
pkgrel=2
pkgdesc="Browser for Raspberry Pi Press publications in PDF format"
arch=('x86_64')
url="https://github.com/raspberrypi-ui/bookshelf"
license=('BSD')
depends=('glib2' 'gtk3>=3.24' 'libx11')
makedepends=('git' 'sed' 'coreutils')
provides=("rp-bookshelf")
conflicts=("rp-bookshelf" "rp-bookshelf-git")
source=('git+https://github.com/raspberrypi-ui/bookshelf.git')
sha256sums=('SKIP')

pkgver() {
  cd "bookshelf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "bookshelf"
}

build() {
	cd "bookshelf"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "bookshelf"
	make -k check
}

package() {
	cd "bookshelf"
	make DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	touch "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sed -n '2,25p' src/rp_bookshelf.c > \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
