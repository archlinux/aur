# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=pymol-autodock
pkgver=2.1.1
pkgrel=2
pkgdesc="Autodock/Vina plugin for PyMOL"
arch=('any')
url="http://wwwuser.gwdg.de/~dseelig/adplugin"
license=('custom')
depends=('pymol' 'autodocksuite' 'autodock-vina' 'mgltools')
source=("http://wwwuser.gwdg.de/~dseelig/autodock.py")
md5sums=('763a44d9ba512dc28809978e81929ca9')

package() {
  cd "$srcdir"
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()"`

  mkdir -p "$pkgdir/usr/share/licenses"
  head -29 autodock.py > "$pkgdir/usr/share/licenses/pymol-autodock"

  sed -i "/autodock_tools_path'] = '/\
    s|''|'$pydir/MGLToolsPckgs/AutoDockTools/Utilities24'|;
    /autogrid_exe'] = '/s|''|'autogrid4'|;
    /autodock_exe'] = '/s|''|'autodock4'|;
    /vina_exe'] = '/s|''|'vina'|" autodock.py

  install -Dm644 autodock.py "$pkgdir/$pydir/pmg_tk/startup/autodock.py"

  cd "$pkgdir/$pydir/pmg_tk/startup"
  chmod a+x .
  python2 -c "import py_compile; py_compile.compile('autodock.py')"
}

