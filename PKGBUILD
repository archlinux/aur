# Maintainer: Matthew Hiles <matthew.hiles@gmail.com>
pkgname=inkscape-silhouette-git
pkgver=r663.8128b6c
pkgrel=1
pkgdesc="inkscape plugin to control Silhouette vinyl cutters"
arch=(any)
url="https://github.com/fablabnbg/inkscape-silhouette"
license=('GPLv2')
groups=()
depends=(inkscape python python-lxml python-pyusb python-numpy)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fablabnbg/inkscape-silhouette')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	#git apply -p1 ../../py3fix.patch
	#python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	cp ../../*.svg "$pkgdir/usr/share/inkscape/templates/"
	mkdir -p "$pkgdir/usr/share/inkscape/extensions/"
	cp sendto_silhouette.* "$pkgdir/usr/share/inkscape/extensions/"
	cp -R silhouette "$pkgdir/usr/share/inkscape/extensions/"
	mkdir -p "$pkgdir/etc/udev/rules.d/"
	cp silhouette-udev.rules "$pkgdir/etc/udev/rules.d/"
	mv "$pkgdir/lib/" "$pkgdir/usr/"
}
