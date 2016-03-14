# Maintainer: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Thor K. H. <thor alfakrøll roht dott no>

pkgname=csvkit-git
pkgver=0.9.1.r280.g48f9602
pkgrel=2
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=('any')
url="http://csvkit.readthedocs.org"
license=('MIT')
depends=(
    'python'
    'python-xlrd' # >=0.9.4 for csvkit and agate
    'python-dateutil' # >=2.2
    'python-sqlalchemy' # >=0.9.3
    'python-openpyxl' # >=2.0.3 for csvkit and agate
    'python-six' # >=1.6.1 for csvkit and agate
    'python-isodate' # >= 0.5.4 for agate
    'python-parsedatetime' # >=1.5 for agate
    'python-pytimeparse' # >= 1.1.5 for agate
)
makedepends=(
    'git'
    'python-setuptools'
    'python-pip'
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
source=(
    'csvkit::git://github.com/wireservice/csvkit.git'
    'agate::git://github.com/wireservice/agate.git'
    'agate-excel::git://github.com/wireservice/agate-excel.git'
    'agate-dbf::git://github.com/wireservice/agate-dbf.git'
)

pkgver() {
  cd "$srcdir/csvkit"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/csvkit"
  # Quick and dirty fix until the author officially supports dateutil>=2.2
  # (see https://github.com/onyxfish/csvkit/issues/370)
  sed -i 's/python-dateutil==2.2/python-dateutil>=2.2/' setup.py
  sed -i 's/openpyxl==2.2.0-b1/openpyxl>=2.2.0-b1/' setup.py
}

package() {
  cd "$srcdir/csvkit"
  python setup.py install --root="$pkgdir/"

  cd "$srcdir/agate"
  python setup.py install --root="$pkgdir/"

  cd "$srcdir/agate-excel"
  python setup.py install --root="$pkgdir/"

  cd "$srcdir/agate-dbf"
  python setup.py install --root="$pkgdir/"

  test -d "$srcdir/tmp" || mkdir "$srcdir/tmp"
  #chmod +r "$pkgdir"
  TMPDIR="$srcdir/tmp" pip install 'Babel>=2.0' dbfread --root "$pkgdir/"
  TMPDIR="$srcdir/tmp" pip install 'dbfread>=2.0.5' --root "$pkgdir/"
}

