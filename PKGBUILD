# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: PepeSmith
# Contributor: Aron Asor <aronasorman at gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor : Douglas Soares de Andrade <dsa@aur.archlinux.org>

# This is no longer a split package with ipython
# because 6.X will never support python2

pkgname=ipython2
pkgver=5.9.0
pkgrel=1
pkgdesc="An enhanced Interactive Python2 shell."
arch=('any')
url="https://ipython.org"
license=('BSD')
depends=('python2' 'python2-traitlets' 'python2-pexpect' 'sqlite'
    'python2-setuptools' 'python2-pickleshare' 'python2-pathlib'
    'python2-backports.shutil_get_terminal_size' 'python2-prompt_toolkit1')
optdepends=("wxpython: needed for ipython2 --gui=wx"
            "python2-nose: for IPython's test suite")
makedepends=('python2-setuptools')
# "wxpython: needed for ipython2 --gui=wx"   does this still work?

source=("ipython-$pkgver.tgz::https://github.com/ipython/ipython/archive/$pkgver.tar.gz"
        "https://pypi.python.org/packages/source/s/simplegeneric/simplegeneric-0.8.1.zip"
        "https://www.packal.org/sites/default/files/public/styles/icon_large/public/workflow-files/nkeimipynbworkflow/icon/icon.png")
md5sums=('d8905868c8618494827b4546608540b8'
         'f9c1fab00fd981be588fc32759f474e3'
         '2901d65f1b1fe354e72850085cd1c072')

# simplegeneric (so old that it only comes in .zip and still refers to the cheeseshop)
# confirm that an update does not break sage?

prepare() {
  cd "$srcdir/ipython-$pkgver"
  find ./ -type f -exec sed -i -e 's/prompt_toolkit/prompt_toolkit1/g' {} \;
}

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/ipython-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0

  cd "$srcdir/simplegeneric-0.8.1"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0

  cd "$srcdir/ipython-$pkgver"
  install -Dm644 docs/source/about/license_and_copyright.rst "$pkgdir/usr/share/licenses/ipython2/LICENSE"

  # hack to get around ipython collision
  cd "$pkgdir/usr/share/man/man1/"
  for i in *; do
    mv $i ${i/%.1/2.1}
  done
  find "$pkgdir/usr/bin/" -type f -regex '.*[^2]$' -delete

  cd "$srcdir/ipython-$pkgver/examples/IPython Kernel/"
  sed -i 's/ython/ython2/g' *.desktop
  sed -i 's/gnome-netstatus-idle/ipython2/' *.desktop
  install -Dm644 ipython.desktop "$pkgdir/usr/share/applications/ipython2.desktop"
  #install -Dm644 ipython-qtconsole.desktop "$pkgdir/usr/share/applications/ipython2-qtconsole.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/ipython2.png"

  #cd "$pkgdir/usr/share/man/man1/IPython/qt/console/resources/icon/"
  #install -Dm644 IPythonConsole.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ipython2.svg"
}

