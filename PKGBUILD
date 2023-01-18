# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=lpm-git
_pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=latest.r0.gd70f827
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/adamharrison/lite-xl-plugin-manager"
license=('MIT')
depends=('lite-xl' 'lua' 'zlib' 'libzip' 'libgit2' 'mbedtls')
# vim needed for xxd
makedepends=('git' 'vim')
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
  lua -e 'io.open("src/lpm.luac", "wb"):write(string.dump(assert(loadfile("src/lpm.lua"))))'
  xxd -i src/lpm.luac > src/lpm.lua.c
  git tag -d latest
  FULL_VERSION=`git describe --tags | tail -c +2`
  gcc -DLPM_VERSION='"'$FULL_VERSION-$CARCH-linux'"' -DLPM_STATIC \
    src/lpm.c src/lpm.lua.c lib/microtar/src/microtar.c -Ilib/microtar/src \
    -lz -lgit2 -lzip -llua -lm -lmbedtls -lmbedx509 -lmbedcrypto -o lpm
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "${srcdir}/${_gitname}"/lpm "$pkgdir/usr/bin"
}
