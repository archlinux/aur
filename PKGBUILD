# Maintainer: Clover Yan <i at khyan dot top>

_pkgname=tongfang-control
pkgname="${_pkgname}-git"
pkgver=r24.365d515
pkgrel=1
pkgdesc="An open-source control centre for controlling Tongfang-based laptops"
arch=('x86_64')
url="https://gitlab.com/siphomateke/tongfang-control"
license=('MIT')
depends=('python' 'acpi_call')
makedepends=('git' 'python-setuptools')
provides=("tongfang-control=${pkgver}-${pkgrel}")
conflicts=('tongfang-control')
source=("git+https://gitlab.com/siphomateke/tongfang-control.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/tongfang-control"
  python setup.py build
}

package() {
  cd "$srcdir/tongfang-control"
  python setup.py install --root="${pkgdir}" --optimize=1 --prefix=/usr

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: set ft=sh:
