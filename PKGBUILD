# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

_pkgname=libddcci
pkgname=libddcci-git
pkgver=0.2.0.r1.g0a31d17
pkgrel=1
pkgdesc='DDC/CI (VESA MCCS) C Library'
arch=('x86_64')
url='https://github.com/TheElevatedOne/libddcci'
license=('MIT')
depends=('glibc')
makedepends=('git' 'linux-api-headers')
optdepends=('i2c-tools')
provides=("${_pkgname}")
conflicts=("$_pkgname")
source=("git+https://github.com/TheElevatedOne/libddcci.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr check
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
