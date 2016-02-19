# Maintainer: Your Name <youremail@domain.com>
pkgname=flatcam-git
_pkgname=FlatCAM
pkgver=r309.4e0fa74
pkgrel=2
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG)"
arch=('any')
url="flatcam.org"
license=('MIT')
depends=('python2-simplejson' 'python2-pyqt4' 'python2-scipy' 'python2-matplotlib' 'python2-shapely' 'python2-rtree' 'python2-svg.path')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/jpcgt/flatcam.git"
		"$pkgname"
		"$pkgname.desktop")
md5sums=('SKIP'
         '80700f0bb07c959dc3019d9664472387'
         'e6496ad0b956d83fbe0e28a3b94e6c4f')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 -O -m py_compile *.py
}


package() {
	install -D -m755 "$pkgname" "$pkgdir/usr/bin/${pkgname%-git}"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 "share/flatcam_icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	rm -r *.sh doc FlatCAM_GTK
	mkdir -p "${pkgdir}/opt/${pkgname%-git}"
	cp -r * "${pkgdir}/opt/${pkgname%-git}"
}
