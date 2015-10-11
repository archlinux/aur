# Maintainer: Michael Schubert <mschu.dev at gmail>
# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=cellprofiler-analyst-git
pkgver=2.0.4.r464.g3a8646d
pkgrel=1
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPLv2')
depends=(
    'wxpython2.8'
    'python2-numpy'
    'python2-scipy'
    'python2-matplotlib'
    'python2-imaging'
    'python2-pytz'
    'python2-verlib'
    'python2-javabridge'
    'python2-bioformats')
optdepends=('cellprofiler: prepare data for CPA')
provides=('cellprofiler-analyst')
source=("$pkgname::git+https://github.com/CellProfiler/CellProfiler-Analyst#commit=3a8646d"
        "cellprofiler-analyst.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  # Should be fixed in the source three
  sed -i '1i#!/usr/bin/env python2' ./CellProfiler-Analyst.py
  rm -rf `find "$pkgdir" -name "tests" -type d`
}

build() {
  cd "$srcdir/$pkgname"
  # force selection of wxpython2.8 (xargs helps handle spaces)
  find . -name '*.py' -print0 | xargs -0 sed -i -e "s/^\(.*\)import wx$/\1import wxversion\n\1wxversion.select(\"2.8\")\n\1import wx/g"

  # python2 setup.py build  # Unusable build system (only for Mac now)
  python2 -m compileall cpa
}

# check() {
#   cd "$srcdir/CellProfiler-Analyst"
#   python2 setup.py test  # Only for Mac now
# }

package() {
  # python2 setup.py install --root="$pkgdir"/ --optimize=1  # Only for Mac now
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir"

  cd "$srcdir/$pkgname"
  cp -r cpa "$pkgdir/$pydir"
  install -Dm755 CellProfiler-Analyst.py "$pkgdir/usr/bin/cellprofiler-analyst"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/cellprofiler-analyst.desktop" "$pkgdir/usr/share/applications/cellprofiler-analyst.desktop"
}
