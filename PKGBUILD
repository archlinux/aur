# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=cellprofiler-git
pkgver=11504.36df52d
pkgrel=1
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPL')
depends=('python2-libtiff-svn' 'python2-numpy' 'python2-scipy' 'wxpython' 'python2-decorator' 'mysql-python' 'python2-matplotlib' 'cython2' 'python2-imaging' 'python2-altgraph')
makedepends=('git' 'python2-pytz' 'python2-nose' 'python2-h5py')
optdepends=('ilastik' 'python2-nuageux' 'python2-pytz' 'python2-nose' 'python2-h5py')
provides=('cellprofiler')
conflicts=('cellprofiler')
source=($pkgname::git+https://github.com/CellProfiler/CellProfiler.git
        cellprofiler.sh)
md5sums=('SKIP'
         '006f8305fd90dd9658727d2c9fb82e18')

pkgver() {
  cd "$srcdir$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  python2 CellProfiler.py --build-and-exit
}

package() {
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir"
  cp -r "$srcdir/$pkgname" "$pkgdir/$pydir/cellprofiler"

  install -Dm755 "$srcdir/cellprofiler.sh" "$pkgdir/usr/bin/cellprofiler"

  cd "$pkgdir/$pydir/cellprofiler"
  rm -rf `find "$pkgdir" -name "tests" -type d` windows_setup.py
  python2 -m compileall -x tutorial "$pkgdir/$pydir/cellprofiler/"
}

