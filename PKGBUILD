# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-common
_pkgname=${pkgname%-common}
pkgver=0.0.90
pkgrel=1
pkgdesc="Icons and translations for Folder Color"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('python' 'hicolor-icon-theme')
makedepends=('git' 'python-distutils-extra')
conflicts=("$_pkgname-bzr")
_commit=e76d1d92e2d1418fa1dcd3f418a8919a2842140d
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | sed 's/-/./')"
}

prepare() {
	cd "$srcdir/$_pkgname/install_scripts"
	./common.sh
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# DistUtilsExtra fails to install locale files
	install -d "$pkgdir/usr/share/locale"
	cp -r build/mo/* "$pkgdir/usr/share/locale"
}
