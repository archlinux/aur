# Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=ipython-git
pkgver=7.12.0.r667.gd737c3250
pkgrel=1
pkgdesc="An enhanced Interactive Python shell - git version"
arch=('any')
url="https://ipython.org"
license=('BSD')
depends=('python' 'python-traitlets' 'python-pexpect' 'sqlite'
         'python-pickleshare' 'python-prompt_toolkit'
         'python-jedi' 'python-pygments' 'python-backcall'
	 'python-stack-data' 'python-executing' 'python-asttokens'
	 'python-pure-eval')
makedepends=('python-setuptools')
optdepends=("python-nose: for IPython's test suite")
conflicts=('ipython')
provides=('ipython')

# new optional thing: ipyparallel

source=("git://github.com/ipython/ipython.git"
        "https://www.packal.org/sites/default/files/public/styles/icon_large/public/workflow-files/nkeimipynbworkflow/icon/icon.png")
md5sums=('SKIP'
         '2901d65f1b1fe354e72850085cd1c072')
_pkgname=ipython

# confirm that an update does not break sage?

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  export PYTHONHASHSEED=0
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 docs/source/about/license_and_copyright.rst "$pkgdir/usr/share/licenses/ipython/LICENSE"

  cd "examples/IPython Kernel"
  # FS#45120
  sed -i 's/gnome-netstatus-idle/ipython/' *.desktop
  install -Dm644 ipython.desktop "$pkgdir/usr/share/applications/ipython.desktop"
  #install -Dm644 ipython-qtconsole.desktop "$pkgdir/usr/share/applications/ipython-qtconsole.desktop"
  # FS#47046
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/ipython.png"

  #cd $srcdir/ipython-$pkgver/IPython/qt/console/resources/icon/
  #install -Dm644 IPythonConsole.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ipython.svg"
}
