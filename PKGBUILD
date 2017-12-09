# Maintainer: Ye Jingchen <ye[dot]jingchen[at]gmail[dot]com>

_pkgname=edgar
pkgname=edgar-git
pkgver=r49.63b9e57
pkgrel=1
pkgdesc="Load Python gadgets in Enlightenment"
arch=('x86_64' 'i686')
url="https://phab.enlightenment.org/w/emodules/edgar/"
license=('GPL3' 'LGPL3')
depends=('enlightenment>=0.17' 'python>=3.2' 'python-efl>=1.11' 'python-dbus'
         'python-psutil')
makedepends=('git')
provides=(edgar)
conflicts=(edgar)
install=edgar-git.install
source=("git+https://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make -j$(nproc)
}

package() {
	cd "$srcdir/$_pkgname"

	# The module
	make DESTDIR="$pkgdir/" install

	# Shipped gadgets
	cd GADGETS
	for gadget in *; do
		make -C "$gadget" prefix="$pkgdir/usr/lib" install
	done
}
