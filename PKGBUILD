# Maintainer: Christopher Sculley <cs.sculley at gmail dot com>
pkgname=sleepplan-git
pkgver=r19.0389933
pkgrel=2
pkgdesc="Calculate times to wake up based on bedtimes, and vice versa."
arch=('any')
license=('GPL3')
url="https://gitlab.com/csculley/sleepplan"
depends=('python3')
makedepends=('git' 'python-setuptools')
provides=('sleepplan')
conflicts=('sleepplan')
source=("$pkgname-$pkgver::git+https://gitlab.com/csculley/sleepplan.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname-$pkgver"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
