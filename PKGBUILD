# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor : Baptiste Jonglez <zerstorer at free dot fr>

pkgbase=python-gnuplot
pkgname=('python2-gnuplot')
pkgver=1.8
pkgrel=2
pkgdesc='Plot graphs with Gnuplot'
arch=('any')
license=('LGPL')
url='http://gnuplot-py.sourceforge.net/'
makedepends=('python2-setuptools' 'python2-numpy')
source=("http://downloads.sourceforge.net/gnuplot-py/gnuplot-py-$pkgver.tar.gz")
sha256sums=('ab339be7847d30a8acfd616f27b5021bfde0999b7bf2d68400fbe62c53106e21')

build() {
  cp -a "gnuplot-py-$pkgver" "gnuplot-py2-$pkgver"
}

package_python2-gnuplot() {
  depends=('python2' 'gnuplot' 'python2-numpy')

  cd "gnuplot-py2-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# TODO: See if someone has developed a Gnuplot module for python 3.
#       Could not find one and the following lead nowhere:
package_python-gnuplot() {
  # remember to add python-setuptools to makedepends if this is to be tested
  depends=('python' 'gnuplot' 'python-numpy')

  cd "gnuplot-py-$pkgver"
  iconv --from-code=ISO-8859-1 --to-code=UTF-8 gnuplot_Suites.py > tmp
  mv tmp gnuplot_Suites.py
  for f in *.py; do 2to3 --no-diffs -w -n -j 4 $f || echo "--- $f"; done
  for f in *.py; do sed -i 's/from ./from /g' $f; sed -i 's/from import/from . import/g' $f; done
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
