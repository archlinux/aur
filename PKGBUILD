# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=gitfourchette
pkgver=1.6.0
pkgrel=1
pkgdesc="The comfortable Git UI for Linux"
arch=(any)
url="https://gitfourchette.org/"
license=('GPL-3.0-only')
depends=(
	'hicolor-icon-theme'
	'python'
	'python-pygit2'
	'python-pyqt6'
	'python-pygments'
)
makedepends=(
	'git'
	'python-pip'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
	'python-pytest-qt'
	'python-pytest-cov'
	'python-pytest-xdist'
	'python-ruff'
)
_tag=7293dc4e86cdb9eac690caba28b862210f34f2fb # git rev-parse "v$pkgver"
source=("git+https://github.com/jorio/gitfourchette#tag=$_tag")
sha256sums=("SKIP")

build() {
	cd "$pkgname"
	python update_resources.py --freeze pyqt6
}

check() {
	cd "$pkgname"
	# TODO: should enable network tests with TESTNET=1?
	./test.py
}

package() {
	cd "$pkgname"
	python -m pip install --verbose --root="$pkgdir" --prefix="/usr" --isolated --ignore-installed --no-deps ".[pyqt6,pygments]"

	# Take the metafiles from the AppImage version
	install -Dm644 pkg/appimage/gitfourchette.desktop "$pkgdir/usr/share/applications/gitfourchette.desktop"
	install -Dm644 pkg/appimage/gitfourchette.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gitfourchette.png"
}
