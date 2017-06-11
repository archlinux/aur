# Maintainer: Bachir Soussi Chiadmi (bach at figureslibres dot io)

pkgname=libriis-git
pkgver=r88.547be1b
pkgrel=1
pkgdesc="PyQt5 based appliaction for writing with markdown and designing with css printed documents."
arch=('any')
url="https://figureslibres.io/gogs/bachir/libriis"
license=('AGPL')
depends=( 'qt5-base' 'python' 'python-pyqt5' 'python-markdown' 'python-pygit2' 'python-beautifulsoup4' 'pandoc' 'python-pypandoc' 'python-pygments' 'python-setuptools' 'desktop-file-utils' 'qt5-webkit-print')
#  'qt5-webkit-ng'

makedepends=('coreutils' 'git' 'python' 'python-setuptools' 'python-pip')
# provides=('cascade')
source=('git+https://figureslibres.io/gogs/bachir/libriis.git' 'libriis.desktop' 'libriis.png')
md5sums=('SKIP' 'da4863b42a1ff9a816d2c0c3c8bc510f' 'd2de8e22b3f16a03c393dc1b8878fb48')
# conflicts=("")

pkgver() {
	cd "$srcdir/libriis"
	# without tags
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# with tags
	# git describe --long --tags| sed 's/^v//g;s/\([^-]*-\)g/r\1/;s/-/./g'

}

# todo : do i need to build ? i think no
# build() {
# 	# cd "$srcdir/tools.ospkit/src/"
# 	# qmake
# 	# make
# }

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 libriis.desktop "$pkgdir/usr/share/applications/libriis.desktop"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	install -Dm644 libriis.png "$pkgdir/usr/share/pixmaps/libriis.png"

	cd "$srcdir/libriis"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --no-deps --exists-action i --requirement requirements.txt
	# --ignore-installed
	# python -O -m compileall "${pkgdir}/path/to/module"

	python setup.py install --root="$pkgdir/" --optimize=1
	# --prefix=/usr/local/
}
