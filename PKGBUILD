# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=('autokey-common' 'autokey-gtk' 'autokey-qt')
pkgbase=autokey
pkgver=0.95.10
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/autokey/autokey"
license=('GPL3')
makedepends=('python-setuptools' 'python-pyqt5')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/autokey/autokey/archive/v$pkgver.tar.gz"
        "$pkgbase.patch")
sha256sums=('e622ca04b3340f1ca0999bf03f05c9071a9f8aa3bc91c26c45c35509d63ff23d'
            '9959643c90b51f4734da70afecb891ad4671ab9f277cc3abf9506421a98acb98')

prepare() {

	# Phrases show up wrong on Firefox and Thunderbird
	# https://code.google.com/archive/p/autokey/issues/278
	patch -Np1 -i "$srcdir/$pkgbase.patch"
}

build() {
	cd "$pkgbase-$pkgver"
	python setup.py build

	# remove shebang from python libraries
	for lib in $(find lib/autokey/ -name "*.py"); do
		sed '/\/usr\/bin\/env/d' $lib > $lib.new &&
		touch -r $lib $lib.new &&
		mv $lib.new $lib
	done
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
	rm -rf "$pkgdir$site_packages/$pkgbase/"{gtkui,qtui}
	rm -rf "$pkgdir/usr/share/applications"
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
	rm -rf "$pkgdir$site_packages/$pkgbase/"{iomediator,qtui}
	rm -rf "$pkgdir$site_packages/"*.egg-info
	rm -rf "$pkgdir/usr/share/icons"
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
	rm -rf "$pkgdir$site_packages/$pkgbase/"{iomediator,gtkui}
	rm -rf "$pkgdir$site_packages/"*.egg-info
	rm -rf "$pkgdir/usr/share/icons"
}
