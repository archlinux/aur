# Maintainer: tsp <patrictroy at gmail dot com>
pkgname=rizin-git
pkgver=4.6.0.r25118.bbccf28ee
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="https://rizin.re/"
license=('GPL3' 'LGPL3')
makedepends=('git' 'meson' 'ninja')
depends=('capstone' 'lz4' 'file' 'libzip' 'xxhash' 'libuv')
provides=('rizin')
source=("$pkgname"::"git://github.com/rizinorg/rizin.git")
md5sums=('SKIP')

pkgver () {
  cd ${pkgname}
  sed -nE '/^VERSION\ [0-9.]*(-git|)$/p' configure.acr|grep -o '[0-9.]*'|tr -d '\n'
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  # this is actually needed to prevent linking against old system-wide r2 libs
  # you can comment this out, if you build in a clean environment
  export PKG_CONFIG_PATH="${srcdir}/${pkgname}/pkgcfg:${PKG_CONFIG_PATH}"

  cd ${srcdir}/${pkgname}
  arch-meson build
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
  cp -r doc/* "${pkgdir}/usr/share/doc/rizin"
  rm "${pkgdir}/usr/share/man/man7/esil.7"
}
