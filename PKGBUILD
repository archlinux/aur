# Maintainer: Michael Schubert <mschu.dev at gmail>
# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=cellprofiler-git
pkgver=2.1.2.SNAPSHOT.r367.g7f8ba1d
pkgrel=1
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPL')
depends=(
    'python2-numpy'
    'python2-scipy'
    'python2-matplotlib'
    'python2-decorator'
    'python2-imaging'
    'mysql-python'
    'python2-javabridge'
    'python2-bioformats'
    'wxpython2.8'
    'python2-libtiff-svn')
makedepends=('cython2' 'python2-pytz' 'python2-nose' 'python2-h5py')
optdepends=(
    'cellprofiler-analyst: analyze imaging datasets'
    'ilastik: interactive segmentation')
provides=('cellprofiler')
source=("$pkgname::git+https://github.com/CellProfiler/CellProfiler.git#commit=7f8ba1d"
        "cellprofiler.sh"
        "cellprofiler.desktop")

md5sums=('SKIP'
         '006f8305fd90dd9658727d2c9fb82e18'
         'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  # force selection of wxpython 2.8
  sed -e "s/^\(.*\)import wx$/\1import wxversion\n\1wxversion.select(\"2.8\")\n\1import wx/g" -i $(find . -name '*.py')

  # External dependencies will be fetched into src directory by CellProfiler.py
  python2 CellProfiler.py --build-and-exit
}

package() {
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir"
  cp -r "$srcdir/$pkgname" "$pkgdir/$pydir/cellprofiler"

  install -Dm755 "$srcdir/cellprofiler.sh" "$pkgdir/usr/bin/cellprofiler"
  install -Dm644 "$srcdir/cellprofiler.desktop" "$pkgdir/usr/share/applications/cellprofiler.desktop"

  cd "$pkgdir/$pydir/cellprofiler"
  rm -rf `find "$pkgdir" -name "tests" -type d` windows_setup.py .git
  python2 -m compileall -x tutorial "$pkgdir/$pydir/cellprofiler/"
}
