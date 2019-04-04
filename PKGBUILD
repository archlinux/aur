# Maintainer: Jake <ja.ke@posteo.de>
pkgname=flatcam-git
_pkgname=FlatCAM
pkgver=r602.46454c2
pkgrel=1
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG)"
arch=('any')
url="http://flatcam.org"
license=('MIT')
depends=('tk' 'python-simplejson' 'python-pyqt4' 'python-scipy' 'python-matplotlib' 'python-shapely' 'python-rtree' 'python-svg.path')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/jpcgt/flatcam.git"
		"$pkgname.desktop")
md5sums=('SKIP'
         '75964eb8fb5d9fbb3da848edbf52af7a')

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
        mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 "share/flatcam_icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	rm -r *.sh doc tests sandbox bugs
	mkdir -p "${pkgdir}/opt/${pkgname%-git}"
	cp -r * "${pkgdir}/opt/${pkgname%-git}"
}
