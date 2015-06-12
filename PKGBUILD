# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-pydstool
_pkgname=pydstool
_pkgName=PyDSTool
pkgver=0.88.111221
_pkgver=0.88
pkgrel=1
pkgdesc="Simulation and analysis environment for dynamical systems"
url="http://www2.gsu.edu/~matrhc/ProjectOverview.html"
license=('BSD')
arch=('any')
depends=('python2-numpy' 'python2-scipy')
makedepends=('dos2unix')
optdepends=('python2-sloppycell')
replaces=('pydstool')
source=("http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$_pkgver/$_pkgName-$pkgver.zip")
options=('!emptydirs')
md5sums=('a58422c0b5755f31340f5707874a4629')

build() {
  cd "$srcdir/$_pkgName"
  make unixify
}

package() {
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir" && cd "$pkgdir/$pydir"
  cp -dr --no-preserve=ownership "$srcdir/$_pkgName" .
  sed -i "/assert(callable, func)/d" PyDSTool/common.py
  echo $_pkgName > "PyDSTool.pth"

  find . -type f -exec chmod 644 {} \;
  find . -type d -exec chmod 755 {} \;
  find . -name "*.py" -exec sed -i '1s/python2.3$/python2/' {} \;
  find . -name "__init__.py" -exec chmod a+x {} \;

  python2 -c "import PyDSTool"
}
