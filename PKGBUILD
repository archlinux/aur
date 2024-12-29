# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=(
  'autokey-common'
  'autokey-gtk'
  'autokey-qt'
)
pkgbase=autokey
pkgver=0.96.0
pkgrel=8
pkgdesc="A desktop automation utility for Linux and X11"
arch=('any')
url="https://github.com/autokey/autokey"
license=('GPL-3.0-or-later')
makedepends=(
  'python-build'
  'python-installer'
  'python-pyqt5'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/autokey/autokey/archive/v$pkgver.tar.gz"
        'imghdr.patch')
sha256sums=('40341fc4cd9703a34264e9191b5938fc7ed5a6f357992d91e492975d89933acd'
            '67d6fb46df85ae8ac820ee76da099fb84c3d5e723720bfe9feba5054b8d0954a')

prepare() {
  cd "$pkgbase-$pkgver"

  # https://github.com/autokey/autokey/issues/961
  patch -Np1 -i ../imghdr.patch
}

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
  depends=(
    'imagemagick'
    'python-dbus'
    'python-magic'
    'python-packaging'
    'python-pyinotify'
    'python-xlib'
    'wmctrl'
    'xautomation'
    'xorg-xwd'
  )
  provides=("$pkgbase")
  conflicts=("$pkgbase")

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-gtk}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{gtkapp.py,qtapp.py}
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-qt*}
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{gtkui,qtui}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"scripting/*{_qt,_gtk}.py
  rm -rf "$pkgdir/usr/share/applications"

  # Manually compile Python bytecode for only installed files
  rm -rf "${pkgdir}${site_packages}/$pkgbase"/{__pycache__,*/__pycache__}
  python -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
  python -O -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
}

package_autokey-gtk() {
  pkgdesc+=" - GTK frontend"
  depends=(
    'autokey-common'
    'gtksourceview3'
    'libayatana-appindicator'
    'libnotify'
    'python-gobject'
    'zenity'
  )
  optdepends=('python-atspi')

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-qt,-run,-shell}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{UI_common_functions,argument_parser,common,dbus_service,interface,logger,macro,monitor,service,__init__,qtapp}.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{configmanager,iomediator,model,qtui}
  rm -f "$pkgdir/usr/share/applications/$pkgbase-qt.desktop"
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-qt*,-run*}
  rm -f "${pkgdir}${site_packages}/$pkgbase/scripting/"{*_qt,common,engine,highlevel,__init__,keyboard,mouse,system,window}.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase-$pkgver.dist-info"
  rm -rf "$pkgdir/usr/share/icons"

  # Manually compile Python bytecode for only installed files
  rm -rf "${pkgdir}${site_packages}/$pkgbase"/{__pycache__,*/__pycache__}
  python -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
  python -O -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
}

package_autokey-qt() {
  pkgdesc+=" - Qt frontend"
  depends=(
    'autokey-common'
    'kdialog'
    'python-pyqt5'
    'python-qscintilla-qt5'
    'qt5-svg'
  )
  optdepends=('qt-at-spi')

  cd "$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  rm -f "$pkgdir/usr/bin/$pkgbase"{-gtk,-run,-shell}
  rm -f "${pkgdir}${site_packages}/$pkgbase/"{UI_common_functions,argument_parser,common,dbus_service,interface,logger,macro,monitor,service,__init__,gtkapp}.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase/"{configmanager,gtkui,iomediator,model}
  rm -f "$pkgdir/usr/share/applications/$pkgbase-gtk.desktop"
  rm -f "$pkgdir/usr/share/man/man1/$pkgbase"{-gtk*,-run*}
  rm -f "${pkgdir}${site_packages}/$pkgbase/scripting/"{*_gtk,common,engine,highlevel,__init__,keyboard,mouse,system,window}.py
  rm -rf "${pkgdir}${site_packages}/$pkgbase-$pkgver.dist-info"
  rm -rf "$pkgdir/usr/share/icons"

  # Manually compile Python bytecode for only installed files
  rm -rf "${pkgdir}${site_packages}/$pkgbase"/{__pycache__,*/__pycache__}
  python -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
  python -O -m compileall -d / "${pkgdir}${site_packages}/$pkgbase"
}
