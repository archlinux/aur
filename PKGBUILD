# Maintainer: Martin Drawitsch <mdraw.gh@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: PepeSmith
# Contributor: Aron Asor <aronasorman at gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor : Douglas Soares de Andrade <dsa@aur.archlinux.org>

# This package will be obsolete once community/ipython gets updated.

pkgname=ipython6
provides=('ipython')
conflicts=('ipython' 'ipython-git')
pkgver=6.2.0
pkgrel=0
pkgdesc="An enhanced Interactive Python shell."
arch=('any')
url="https://ipython.org"
license=('BSD')
depends=('python' 'python-traitlets' 'python-pexpect' 'sqlite'
         'python-setuptools' 'python-pickleshare' 'python-prompt_toolkit'
         'python-jedi' 'python-decorator' 'python-pygments')
makedepends=('python-setuptools')


source=("ipython-$pkgver.tgz::https://github.com/ipython/ipython/archive/$pkgver.tar.gz"
        "https://pypi.python.org/packages/source/s/simplegeneric/simplegeneric-0.8.1.zip"
        "http://www.packal.org/sites/default/files/public/styles/icon_large/public/workflow-files/nkeimipynbworkflow/icon/icon.png")
md5sums=('88b88f2ecd55362b9f6b1017f6fdbbd0'
         'f9c1fab00fd981be588fc32759f474e3'
         '2901d65f1b1fe354e72850085cd1c072')

# With 4.0 many previously bundled external libraries are no longer bundled
# Most are written/maintained/used only by the ipython project
# Since there are so many and they are so small, they get re-bundled here
# Break them out if any non-ipython package ends up needing these

# simplegeneric (so old that it only comes in .zip and still refers to the cheeseshop)

# confirm that an update does not break sage?


package() {
  cd "$srcdir/ipython-$pkgver"

  python setup.py install --root="${pkgdir}" --optimize=1

  cd "$srcdir/simplegeneric-0.8.1"
  python setup.py install --root="${pkgdir}" --optimize=1

  cd "$srcdir/ipython-$pkgver"
  install -Dm644 docs/source/about/license_and_copyright.rst "$pkgdir/usr/share/licenses/ipython/LICENSE"

  cd "$srcdir/ipython-$pkgver/examples/IPython Kernel/"
  # FS#45120
  sed -i 's/gnome-netstatus-idle/ipython/' *.desktop
  install -Dm644 ipython.desktop "$pkgdir/usr/share/applications/ipython.desktop"
  #install -Dm644 ipython-qtconsole.desktop "$pkgdir/usr/share/applications/ipython-qtconsole.desktop"
  # FS#47046
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/ipython.png"

  #cd $srcdir/ipython-$pkgver/IPython/qt/console/resources/icon/
  #install -Dm644 IPythonConsole.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ipython.svg"
}
