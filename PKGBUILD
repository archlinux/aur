# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgname=plots-git
pkgver=0.6.1.r158.gd9018c9
pkgrel=1
pkgdesc="A graph plotting app for GNOME"
arch=('any')
url="https://github.com/alexhuntley/Plots/"
license=('GPL')
depends=(
	'gtk3'
	'python-gobject'
	'python-opengl'
	'python-jinja'
	'python-numpy'
	'python-lark-parser'
	'otf-latinmodern-math'
	'python-freetype-py'
	'python-pyglm'
)

makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=('plots')
conflicts=('plots')
source=(
	"plots::git+https://github.com/alexhuntley/Plots.git"
)
md5sums=('SKIP')

pkgver()
{
	cd "$srcdir/plots"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd plots
	python setup.py build
}

check() {
	cd plots
	python setup.py test
}
package() {
	cd plots
	rm -rf build/lib/tests
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D -t "$pkgdir/usr/share/help/C/plots/" help/C/*
	install -Dm644 res/com.github.alexhuntley.Plots.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/plots.svg"
	install -Dm644 res/com.github.alexhuntley.Plots-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/plots-symbolic.svg"
	install -Dm644 res/com.github.alexhuntley.Plots.desktop "$pkgdir/usr/share/applications/plots.desktop"
	sed -Ei 's/^(Icon=).*$/\1plots/' "$pkgdir/usr/share/applications/plots.desktop"
}
