# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=nats-cclient-git
_pkgname=nats.c
pkgver=v1.8.0.r11.g7e071ff
pkgrel=1
pkgdesc="NATS & NATS Streaming - C Client"
arch=('i686' 'x86_64')
url="https://github.com/nats-io/nats.c"
license=('GPL')
depends=()
makedepends=(glibc cmake git autoconf automake gcc)
optdepends=()
provides=('nats-cclient')
conflicts=('nats-cclient')
replaces=('nats-cclient')
source=(${_pkgname}::git+https://github.com/nats-io/nats.c.git#branch=master)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"



	make DESTDIR="$pkgdir/" install
}
