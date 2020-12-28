# Maintainer: Kristóf Marussy <kristof@marussy.com>
# Contributor: Adrian Perez <aperez@igalia.com>
pkgname=beanprice-git
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=1.0.1.r11.g7614b25
pkgrel=1
arch=(any)
url=http://furius.ca/beancount/
license=(GPL)
source=("${pkgname}::git+https://github.com/beancount/beanprice/")
sha512sums=('SKIP')
depends=('python>=3.5' 'beancount>=2.3.1' 'python-dateutil' 'python-requests')
makedepends=('git' 'python-pytest')
provides=("beanprice=${pkgver%%.r*}")
conflicts=(beanprice)

pkgver() {
    cd "${pkgname}"
    (
         set -o pipefail
         git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
         printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

 check () {
   cd "${pkgname}"
   pytest beanprice
}

package () {
    cd "${pkgname}"
    python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

