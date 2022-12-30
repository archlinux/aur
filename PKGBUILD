# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=lpm-git
_pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=0.2.r9.ge2bb76d
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/adamharrison/lite-xl-plugin-manager"
license=('MIT')
depends=('lite-xl' 'lua' 'zlib' 'libzip' 'libgit2' 'mbedtls')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/adamharrison/lite-xl-plugin-manager")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_gitname}"
  git submodule update --init lib/microtar
}

build() {
  cd "${_gitname}"
  gcc src/lpm.c lib/microtar/src/microtar.c -Ilib/microtar/src -lz -lgit2 \
    -lzip -llua -lm -lmbedtls -lmbedx509 -lmbedcrypto -o lpm
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "${srcdir}/${_gitname}"/lpm "$pkgdir/usr/bin"
}
