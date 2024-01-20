# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=('autokey-common' 'autokey-gtk' 'autokey-qt')
pkgbase=autokey
pkgver=0.96.0
pkgrel=4
pkgdesc="A desktop automation utility for Linux and X11"
arch=('any')
url="https://github.com/autokey/autokey"
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-pyqt5' 'python-setuptools' 'python-wheel')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/autokey/autokey/archive/v$pkgver.tar.gz")
sha256sums=('40341fc4cd9703a34264e9191b5938fc7ed5a6f357992d91e492975d89933acd')

build() {
  cd "$pkgbase-$pkgver"
  python -m build --wheel --no-isolation

  # remove shebang from python libraries
  for lib in $(find lib/autokey/ -name "*.py"); do
    sed '/\/usr\/bin\/env/d' $lib > $lib.new &&
    touch -r $lib $lib.new &&
    mv $lib.new $lib
  done
}

package_autokey-common() {
  pkgdesc+=" - common data"
  depends=('python-pyinotify' 'python-xlib' 'python-dbus' 'wmctrl'
           'gtk-update-icon-cache' 'xautomation' 'imagemagick' 'xorg-xwd')
  provides=("$pkgbase")
  conflicts=("$pkgbase")

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-gtk}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{gtkapp.py,qtapp.py}
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-qt*}
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{gtkui,qtui}
  rm -rf "$pkgdir/usr/share/applications"
}

package_autokey-gtk() {
  pkgdesc+=" - GTK frontend"
  depends=('autokey-common' 'python-gobject' 'gtksourceview3' 'libappindicator-gtk3'
           'libnotify' 'zenity')
  optdepends=('python-atspi')

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-run,-shell}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{UI_common_functions,argument_parser,common,dbus_service,interface,logger,macro,monitor,service,__init__,qtapp}.py
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{iomediator,model}/*.py
  rm -f "$pkgdir/usr/share/applications/$pkgbase-qt.desktop"
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-qt*,-run*}
  rm -f "${pkgdir}${site_packages}/$pkgbase/scripting/"*_qt.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{configmanager,qtui,scripting}
  rm -rf "${pkgdir}${site_packages}/$pkgbase/__pycache__"
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{iomediator,model}/__pycache__
  rm -rf "${pkgdir}${site_packages}/$pkgbase-$pkgver.dist-info"
  rm -rf "$pkgdir/usr/share/icons"
}

package_autokey-qt() {
  pkgdesc+=" - Qt frontend"
  depends=('autokey-common' 'python-pyqt5' 'python-qscintilla-qt5' 'qt5-svg' 'kdialog')
  optdepends=('qt-at-spi')

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-gtk,-run,-shell}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{UI_common_functions,argument_parser,common,dbus_service,interface,logger,macro,monitor,service,__init__,gtkapp}.py
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{iomediator,model}/*.py
  rm -f "$pkgdir/usr/share/applications/$pkgbase-gtk.desktop"
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-run*}
  rm -f "${pkgdir}${site_packages}/$pkgbase/scripting/"*_gtk.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{configmanager,gtkui,scripting}
  rm -rf "${pkgdir}${site_packages}/$pkgbase/__pycache__"
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{iomediator,model}/__pycache__
  rm -rf "${pkgdir}${site_packages}/$pkgbase-$pkgver.dist-info"
  rm -rf "$pkgdir/usr/share/icons"
}
