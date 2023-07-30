#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.12.r0.g16924db
pkgrel=2
pkgdesc="Mode S multilateration client by Mutability"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mutability/${pkgname%-git}"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}" "fa-${pkgname%-git}")
conflicts=("${pkgname%-git}" "fa-${pkgname%-git}")
changelog="$pkgname.changelog"
source=("${pkgname%-git}::git+$url.git#branch=dev"
        "python-function-names.patch")
sha256sums=('SKIP'
            'c3645a1535418c1c0b083f101c07b8243c1ac947e21f07a501c868d95c3bf43c')
b2sums=('SKIP'
        '123f866478b0100dce0efbca8db88a302ddc50aedf82153da6aa097874f6319908eceb1edb274f16edc8c6f09a51d56800d687c44aaf57dda2b698f4885e2a14')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/python-function-names.patch"
}

build() {
  cd "${pkgname%-git}"
  ./setup.py build
}

package() {
  cd "${pkgname%-git}"
  ./setup.py install --prefix="${pkgdir}/usr"
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" fa-mlat-client
  install -Dm755 -t "${pkgdir}/usr/bin/" mlat-client
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
}
