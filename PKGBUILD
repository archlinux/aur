# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libdvdcss-git
pkgname=(
  'libdvdcss-git'
  'lib32-libdvdcss-git'
)
pkgver=1.5.0.27.g2682a4a
pkgrel=1
pkgdesc='A portable abstraction library for DVD decryption. (GIT version)'
arch=('x86_64')
license=('GPL2')
url='https://www.videolan.org/libdvdcss'
makedepends=(
  'git'
  'glibc'
  'lib32-glibc'
  'meson'
)
provides=('libdvdcss.so')
source=('git+https://code.videolan.org/videolan//libdvdcss.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdcss
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd libdvdcss

  arch-meson . build

  meson compile -C build

  arch-meson . build32 \
    --cross-file lib32

  meson compile -C build32
}

package_libdvdcss-git() {
  depends=('glibc')
  provides+=('libdvdcss')
  conflicts=('libdvdcss')

  meson install -C libdvdcss/build --destdir "${pkgdir}"
}

package_lib32-libdvdcss-git() {
  pkgdesc+=" (32-bits)"
  depends=('lib32-glibc')
  provides+=('lib32-libdvdcss')
  conflicts=('lib32-libdvdcss')

  meson install -C libdvdcss/build32 --destdir "${pkgdir}"

  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"
}
