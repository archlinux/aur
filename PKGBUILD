# Maintainer: Alfio Saitta <info.collateral@gmail.com>

pkgname=flatcam-qt6
_pkgname=FlatCAM
pkgver=r4040.0e4eb263
pkgrel=1
pkgdesc="Generates CNC gcode from 2D PCB files (Gerber/Excellon/SVG) [QT6 Fork]"
arch=('any')
url="http://flatcam.org"
license=('MIT')
depends=('tk'
        'cython'
        'python-dateutil'
        'python-simplejson'
        'python-pyqt6'
        'python-opengl'
        'python-kiwisolver'
        'python-scipy'
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
        'python-networkx'
        'python-pikepdf'
        'hicolor-icon-theme'
)
makedepends=('git')
provides=("${pkgname%-qt6}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/marius_stanciu/flatcam_beta.git"
        "$pkgname.desktop"
        "${pkgname%_qt6}.xml"
        "${pkgname%_qt6}.sh")
md5sums=('SKIP'
         'b37df8f8e53b6bfc7bc5cf3edcdc6e6c'
         'e4a7f457350aa2e1c62cbe43f3b23e90'
         'd1abc7ac742630ef04071137b9dca85b')

prepare() {
    mv "$srcdir/flatcam_beta" "$srcdir/${pkgname%-beta}"
	cd "$srcdir/${pkgname%-beta}"
	git checkout Beta_8.995
}

pkgver() {
	cd "$srcdir/${pkgname%-beta}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-beta}"
	python -O -m py_compile *.py
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/${pkgname%_qt6}/${pkgname%_qt6}" "$pkgdir/usr/bin/${pkgname%_qt6}"
	install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%_qt6}.desktop"
	install -D -m644 "${pkgname%_qt6}.xml" -t "$pkgdir/usr/share/mime/packages/"
	install -D -m755 "${pkgname%_qt6}.sh" "$pkgdir/usr/bin/${pkgname%_qt6}"
	cd "$srcdir/${pkgname%-qt6}"
	install -D -m644 "assets/linux/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%_qt6}.png"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -rf *.sh doc tests
	mkdir -p "${pkgdir}/opt/${pkgname%_qt6}"
	cp -r * "${pkgdir}/opt/${pkgname%_qt6}"
}
