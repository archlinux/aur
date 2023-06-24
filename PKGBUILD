# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=ppm-git
_pkgname=ppm
_gitname=plugin-manager
pkgver=1.0.2.r43.gc1f8a7a
pkgrel=1
pkgdesc='A plugin manager for the Pragtical editor'
arch=('x86_64' 'aarch64')
url="https://github.com/pragtical/plugin-managerr"
license=('MIT')
depends=('pragtical' 'lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
# vim needed for xxd
makedepends=('git' 'cmake' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/pragtical/plugin-manager")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_gitname}"
  git submodule update --init
}

build() {
  cd "${_gitname}"
  ./build.sh -lz -lgit2 -lzip -llua -lm \
             -lmbedtls -lmbedx509 -lmbedcrypto \
             -DPPM_STATIC \
             -I/usr/include/mbedtls2 \
             -L/usr/lib/mbedtls2
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "${srcdir}/${_gitname}"/ppm "$pkgdir/usr/bin"
}
