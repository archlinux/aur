# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=('autokey-common' 'autokey-gtk' 'autokey-qt')
pkgbase=autokey
pkgver=0.95.10
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/autokey/autokey"
license=('GPL3')
makedepends=('python-setuptools' 'python-pyqt5')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/autokey/autokey/archive/v$pkgver.tar.gz")
sha256sums=('e622ca04b3340f1ca0999bf03f05c9071a9f8aa3bc91c26c45c35509d63ff23d')

build() {
	cd "$pkgbase-$pkgver"
	python setup.py build
}

package_autokey-common() {
	pkgdesc="A desktop automation utility for Linux and X11 - common data"
	depends=('python-pyinotify' 'python-xlib' 'python-dbus' 'wmctrl'
	         'gtk-update-icon-cache' 'xautomation' 'imagemagick' 'xorg-xwd')
	provides=("$pkgbase")
	conflicts=("$pkgbase")

	cd "$pkgbase-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip build

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-gtk}
	rm -f "$pkgdir$site_packages/$pkgbase/"{gtkapp.py,qtapp.py}
	rm -f "$pkgdir$site_packages/$pkgbase/__pycache__/"{gtkapp*,qtapp*}
	rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-qt*}
	rm -f -rf "$pkgdir$site_packages/$pkgbase/"{gtkui,qtui}
	rm -f -rf "$pkgdir/usr/share/applications"
}

package_autokey-gtk() {
	pkgdesc="A desktop automation utility for Linux and X11 - GTK frontend"
	depends=('autokey-common' 'python-gobject' 'gtksourceview3' 'libappindicator-gtk3'
	         'libnotify' 'zenity')
	optdepends=('python-atspi')
	conflicts=("$pkgbase-qt")

	cd "$pkgbase-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip build

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-run,-shell}
	rm -f "$pkgdir$site_packages/$pkgbase/"{common*,config*,__init__*,interface*,macro*,model*,monitor*,qtapp*,scripting*,service*}
	rm -f "$pkgdir$site_packages/$pkgbase/__pycache__/"{common*,config*,__init__*,interface*,macro*,model*,monitor*,qtapp*,scripting*,service*}
	rm -f "$pkgdir/usr/share/applications/$pkgbase-qt.desktop"
	rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-qt*,-run*}
	rm -f -rf "$pkgdir$site_packages/$pkgbase/"{iomediator,qtui}
	rm -f -rf "$pkgdir$site_packages/"*.egg-info
	rm -f -rf "$pkgdir/usr/share/icons"
}

package_autokey-qt() {
	pkgdesc="A desktop automation utility for Linux and X11 - Qt frontend"
	depends=('autokey-common' 'python-pyqt5' 'python-qscintilla-qt5' 'qt5-svg' 'kdialog')
	optdepends=('qt-at-spi')
	conflicts=("$pkgbase-gtk")

	cd "$pkgbase-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip build

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	rm -f "$pkgdir/usr/bin/$pkgbase"{-gtk,-run,-shell}
	rm -f "$pkgdir$site_packages/$pkgbase/"{common*,config*,gtkapp*,__init__*,interface*,macro*,model*,monitor*,scripting*,service*}
	rm -f "$pkgdir$site_packages/$pkgbase/__pycache__/"{common*,config*,gtkapp*,__init__*,interface*,macro*,model*,monitor*,scripting*,service*}
	rm -f "$pkgdir/usr/share/applications/$pkgbase-gtk.desktop"
	rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-run*}
	rm -f -rf "$pkgdir$site_packages/$pkgbase/"{iomediator,gtkui}
	rm -f -rf "$pkgdir$site_packages/"*.egg-info
	rm -f -rf "$pkgdir/usr/share/icons"
}
