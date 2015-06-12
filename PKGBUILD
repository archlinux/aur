# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=cellprofiler-analyst-git
pkgver=20121017
pkgrel=1
pkgdesc="Analysis software for cellular images"
arch=('i686' 'x86_64')
url="http://www.cellprofiler.org/"
license=('GPLv2')
depends=('cellprofiler-git')
makedepends=('git' 'python2-distribute')
provides=('cellprofiler-analyst')
conflicts=('cellprofiler-analyst')

_gitroot="git://github.com/CellProfiler/CellProfiler-Analyst.git"
_gitname="CellProfiler-Analyst"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname/cpa"

  CP_HOME=/usr/lib/python2.7/site-packages/cellprofiler python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`

mkdir -p "$pkgdir/usr/bin"
cat > "$pkgdir/usr/bin/cpa" << EOF
#!/bin/sh
python2 "$pydir/cpa/cpa.py"
EOF
chmod 755 "$pkgdir/usr/bin/cpa"

  mkdir -p "$pkgdir/$pydir"
  cp -r cpa "$pkgdir/$pydir"

  python2 -m compileall "$pkgdir/$pydir/cpa/" || return 0
}

