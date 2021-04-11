# Maintainer: Jake <aur@ja-ke.tech>

pkgname=flatcam-git
_pkgname=FlatCAM
pkgver=r3472.a64d01b5
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
        'python-vispy'
        'python-rasterio'
        'python-ezdxf'
        'python-dill'
        'python-freetype-py'
        'python-fonttools'
        'python-or-tools'
        'python-lxml'
        'python-cycler'
        'python-qrcode'
        'hicolor-icon-theme'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/jpcgt/flatcam.git"
        "$pkgname.desktop"
        "${pkgname%-git}.xml"
        "${pkgname%-git}.sh")
md5sums=('SKIP'
         '8a0be1fc39b87116cba4162dc1257e2e'
         'e4a7f457350aa2e1c62cbe43f3b23e90'
         'd1abc7ac742630ef04071137b9dca85b')

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
	install -D -m644 "${pkgname%-git}.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -D -m755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 "assets/linux/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-git}.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -rf *.sh doc tests
	mkdir -p "${pkgdir}/opt/${pkgname%-git}"
	cp -r * "${pkgdir}/opt/${pkgname%-git}"
}
