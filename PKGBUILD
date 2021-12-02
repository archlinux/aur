# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.4.1
pkgrel=3
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=(MIT)
depends=(python python-asn1crypto)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytest-mock)
source=("https://files.pythonhosted.org/packages/source/s/scramp/scramp-$pkgver.tar.gz"{,.asc})
sha256sums=('f964801077be9be2a1416ffe255d2d78834b3d9d5c8ce5d28f76a856f209f70e'
            'SKIP')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

prepare() {
  cd scramp-$pkgver

  # Remove upper bounds of dependencies
  sed --in-place=.orig -r 's#,?<[0-9.]+,?##;s#==([0-9.]+)#>=\1#' setup.py
  diff -u setup.py{.orig,} || true
}

build() {
  cd scramp-$pkgver
  python setup.py build
}

check() {
  cd scramp-$pkgver
  python -m pytest test
}

package() {
  cd scramp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
