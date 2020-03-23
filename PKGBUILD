# Maintainer: Jake <ja.ke@posteo.de>
pkgname=flatcam-git
_pkgname=FlatCAM
pkgver=r2350.e2e8bde5
pkgrel=1
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG)"
arch=('any')
url="http://flatcam.org"
license=('MIT')
depends=('tk'
        'cython'
        'python-dateutil'
        'python-simplejson'
        'python-pyqt5'
        'python-opengl'
        'python-kiwisolver'
        'python-scipy'
#         'python-numpy'
        'python-matplotlib'
        'python-shapely'
        'python-rtree'
        'python-svg.path'
        'python-reportlab'
        'python-svglib'
        'python-vispy-git'
        'python-rasterio'
        'python-ezdxf'
        'python-dill'
        'python-freetype-py'
        'python-fonttools'
        'python-or-tools'
        'python-lxml'
        'python-cycler'
        'python-qrcode'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/jpcgt/flatcam.git"
        "$pkgname.desktop"
        "${pkgname%-git}.sh")
md5sums=('SKIP'
         '75964eb8fb5d9fbb3da848edbf52af7a'
         'ff3e92a98fa93954cfaf6c5d62a05643')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout Beta
}
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -O -m py_compile *.py
}


package() {
        mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -D -m755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 "share/flatcam_icon256.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	rm -r *.sh doc tests
	mkdir -p "${pkgdir}/opt/${pkgname%-git}"
	cp -r * "${pkgdir}/opt/${pkgname%-git}"
}
