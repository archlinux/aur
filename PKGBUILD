pkgname=pywinery
pkgver=0.3.3
pkgrel=2
pkgdesc="Graphical and simple wine-prefix manager which allows you to launch apps and manage configuration of separate prefixes."
license=('GPLv3')
url='https://github.com/ergoithz/pywinery'
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-gobject>=3.4' 'gtk3' 'xdg-utils' 'icoutils' 'librsvg')
optdepends=(
	'winetricks: Install various redistributable runtime libraries in Wine'
	'wine: System wine version'
)
install='pywinery.install'
source=(
	'https://github.com/ergoithz/pywinery/releases/download/0.3.3/pywinery_0.3-3.tar.gz'
	'patch-gtk-version.patch'
)
sha256sums=(
	'ed2d5c103fa5a9fb8253532b66c718aee3c64d6c6488872322448731554033f5'
	'2241f5871227befd56238499f2ea459f9f7d013c871aea95edf8419cb98c6245'
)

prepare() {
	# Patch loading of gtk to ensure gtk3 is loaded
	patch --directory="${srcdir}/${pkgver%.*}" --forward --strip=1 --input="${srcdir}/patch-gtk-version.patch"
}

build() {
	cd ${srcdir}/${pkgver%.*}
	python setup.py build
}

package() {
	cd ${srcdir}/${pkgver%.*}
	python setup.py install --root="${pkgdir}" --optimize=1

	# Move app icon to proper folder
	install -D -m644 ${pkgdir}/usr/share/pywinery/pywinery.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pywinery.svg
	rm ${pkgdir}/usr/share/pywinery/pywinery.svg
}
