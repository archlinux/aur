# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Axper Jan <483ken _at_ gmail
_gitname=udis86
pkgname=lib32-${_gitname}-git
pkgver=1.7.2.185.g2738fe5
pkgrel=1
pkgdesc="Disassembler library for x86 (32-bit shared library)"
arch=('x86_64')
url="http://${_gitname}.sourceforge.net"
license=('custom:BSD-2-clause')
depends=(lib32-glibc)
makedepends=(cmake git lib32-gcc-libs python)
provides=(lib32-${_gitname} deepin-udis86)
conflicts=(lib32-${_gitname})
source=(git+https://github.com/canihavesomecoffee/${_gitname}.git)
sha512sums=('SKIP')
CFLAGS+=" -m32"

pkgver() {
  cd ${_gitname}
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g;s|^v||'
}

prepare() {
  cd ${_gitname}/libudis86
  sed -i 's/STATIC/SHARED/' CMakeLists.txt
}

build() {
  cd ${_gitname}

  # https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build/libudis86
}

package() {
  cd ${_gitname}
  install -Dm644 build/libudis86/liblibudis86.so \
    "${pkgdir}/usr/lib32/libudis86.so.0.0.0"
  ln -s libudis86.so.0.0.0 "${pkgdir}/usr/lib32/libudis86.so.0"
  ln -s libudis86.so.0 "${pkgdir}/usr/lib32/libudis86.so"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
