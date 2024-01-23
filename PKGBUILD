#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.13.r0.gfe70767
pkgrel=2
pkgdesc="Mode S multilateration client by Mutability"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mutability/${pkgname%-git}"
license=('GPL-3.0-or-later')
depends=('glibc' 'python')
makedepends=('git' python-{build,installer,wheel} python-setuptools)
provides=("${pkgname%-git}=$pkgver" "fa-${pkgname%-git}")
conflicts=("${pkgname%-git}" "fa-${pkgname%-git}")
changelog="$pkgname.changelog"
source=("git+$url.git#branch=dev")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git -C "${srcdir}/${pkgname%-git}" clean -dfx # ensure no old build artifacts
}

build() {
  cd "${pkgname%-git}"
  python -m build -wn
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" "${pkgdir}/usr/bin/fa-mlat-client"
}
