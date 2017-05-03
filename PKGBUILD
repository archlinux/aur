# Maintainer: Michael Schubert <mschu.dev at gmail>
# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=cellprofiler-analyst-git
pkgver=2.2.0.r0.gf45d68a
pkgrel=1
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPLv2')
depends=(
    'wxpython'
    'python2-pytz'
    'python2-numpy'
    'python2-scipy'
    'python2-matplotlib'
    'python2-imaging'
    # 'python2-mock'
    'python2-scikit-learn'
    'python2-pandas'
    'python2-verlib'
    'python2-seaborn'
    'python2-javabridge'
    'python2-bioformats')
optdepends=('cellprofiler: prepare data for CPA')
provides=('cellprofiler-analyst')
source=("$pkgname::git+https://github.com/CellProfiler/CellProfiler-Analyst#tag=2.2.0"
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
    # python2 setup.py build  # Unusable build system (only for Mac now)
    python2 -m compileall cpa
}

package() {
  # python2 setup.py install --root="$pkgdir" --optimize=1  # Unusable build system (only for Mac now)
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir"

  cd "$srcdir/$pkgname"
  cp -r cpa "$pkgdir/$pydir"
  install -Dm755 CellProfiler-Analyst.py "$pkgdir/usr/bin/cellprofiler-analyst"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/cellprofiler-analyst.desktop" "$pkgdir/usr/share/applications/cellprofiler-analyst.desktop"
}
