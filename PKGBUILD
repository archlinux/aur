# Maintainer: Adrien Smith <adrien at panissupraomnia dot dev>
# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ect-git
_pkgname=Efficient-Compression-Tool
pkgver=0.9.5.r0.g9aabc23
pkgrel=1
pkgdesc='File compressor supporting postcompression of PNG, JPEG, GZIP and ZIP files'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fhanau/${_pkgname}"
license=('Apache-2.0')
depends=('gcc-libs'
         'glibc')
makedepends=('cmake'
             'git'
             'nasm')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive --recommend-shallow
}

build() {
  cd "${_pkgname}"
  mkdir -p build
  cd build
  cmake ../src
  make
}

package() {
  cd "${_pkgname}/build"
  install -Dm755 ect "$pkgdir"/usr/bin/ect

  # Some things expect this to be an all-caps name
  ln -r -s "${pkgdir}"/usr/bin/ect "${pkgdir}"/usr/bin/ECT
}
