# Maintainer: willemw <willemw12@gmail.com>

_pkgname2=spyder
_pkgname3=spyder3
pkgbase=$_pkgname2-git
pkgname=($_pkgname2-git $_pkgname3-git)
pkgver=3.0.0b1.r172.g47a5a0c
pkgrel=1
arch=('any')
url="https://github.com/spyder-ide/spyder"
license=('MIT')
makedepends=('python2-sphinx' 'python2-setuptools' 
             'python-sphinx' 'python-setuptools'
             'git')
install=$pkgname.install
source=($_pkgname2::git://github.com/spyder-ide/spyder.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname2
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

prepare() {
  rm -rf $_pkgname3
  cp -a $_pkgname2 $_pkgname3

  # Patch Python/Python2
  cd $_pkgname2
  sed -i 's|#![ ]*/usr/bin/env python[ \t\r]*$|#!/usr/bin/env python2|' spyderlib/utils/external/pickleshare.py
}

build() {
  cd "$srcdir/$_pkgname2"
  python2 setup.py build

  cd "$srcdir/$_pkgname3"
  python setup.py build
}

package_spyder-git() {
  pkgdesc="Scientific PYthon Development EnviRonment providing MATLAB-like features (Python 2 version)"
  depends=('ipython2-notebook' 'python2-pyqt4' 'python2-pyflakes' 'python2-pyzmq' 'python2-pygments'
           'desktop-file-utils' 'gtk-update-icon-cache')
  #'ipython2<4.0: enhanced Python interpreter'
  #'ipython2-notebook>=4.0: enhanced Python interpreter (qtconsole)'
  optdepends=('python2-pylint: powerful code analysis'
              'python2-rope: editor code completion, calltips and go-to-definition'
              'python2-sphinx: rich text help on the object inspector'
              'python2-numpy: N-dimensional arrays'
              'python2-scipy: signal/image processing'
              'python2-psutil: memory/CPU usage in the status bar'
              'python2-h5py: HDF5 support'
              'python2-matplotlib: interactive 2D/3D data plotting'
              'pep8-python2: real-time code style analysis'
              'python2-sympy: symbolic mathematics for the IPython console')
  provides=($_pkgname2)
  conflicts=($_pkgname2)

  cd $_pkgname2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  # Install a scalable icon for the spyder.desktop file
  install -Dm644 spyderlib/images/spyder.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/spyder.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname2/LICENSE"
  rm "$pkgdir/usr/bin/spyder_win_post_install.py"
}

package_spyder3-git() {
  pkgdesc="Scientific PYthon Development EnviRonment providing MATLAB-like features (Python 3 version)"
  depends=('jupyter' 'python-pyqt4' 'python-pyflakes' 'python-pyzmq' 'python-pygments'
           'desktop-file-utils' 'gtk-update-icon-cache')
  #'ipython<4.0: enhanced Python interpreter'
  #'jupyter>=4.0: enhanced Python interpreter (qtconsole)'
  optdepends=('python-pylint: powerful code analysis'
              'python-rope: editor code completion, calltips and go-to-definition'
              'python-sphinx: rich text help on the object inspector'
              'python-numpy: N-dimensional arrays'
              'python-scipy: signal/image processing'
              'python-psutil: memory/CPU usage in the status bar'
              'python-h5py: HDF5 support'
              'python-matplotlib: interactive 2D/3D data plotting'
              'pep8: real-time code style analysis'
              'python-sympy: symbolic mathematics for the IPython console')
  provides=($_pkgname3)
  conflicts=($_pkgname3)

  cd $_pkgname3
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  # Install a scalable icon for the spyder3.desktop file
  install -Dm644 spyderlib/images/spyder.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/spyder3.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname3/LICENSE"
  rm "$pkgdir/usr/bin/spyder_win_post_install.py"
}

