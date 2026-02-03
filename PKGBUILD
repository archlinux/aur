# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libdvdnav-git
pkgname=(
  'libdvdnav-git'
  'lib32-libdvdnav-git'
)
pkgver=7.0.0.1.gcf11277
pkgrel=1
pkgdesc="Library to navigate DVD disks. (GIT version)"
arch=('x86_64')
license=('GPL2')
url='https://dvdnav.mplayerhq.hu'
makedepends=(
  'git'
  'libdvdread'
  'lib32-libdvdread'
  'glibc'
  'lib32-glibc'
  'meson'
)
provides=('libdvdnav.so')
source=('git+https://code.videolan.org/videolan/libdvdnav.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdnav
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd libdvdnav

  arch-meson . build

  meson compile -C build

  arch-meson . build32 \
    --cross-file lib32

  meson compile -C build32
}

package_libdvdnav-git() {
  depends=(
    'libdvdread.so'
    'glibc'
  )
  provides+=('libdvdnav')
  conflicts=('libdvdnav')

  meson install -C libdvdnav/build --destdir "${pkgdir}"
}

package_lib32-libdvdnav-git() {
  pkgdesc+=" (32-bits)"
  depends=(
    'libdvdread.so'
    'lib32-glibc'
  )
  provides+=('lib32-libdvdnav')
  conflicts=('lib32-libdvdnav')

  meson install -C libdvdnav/build --destdir "${pkgdir}"

  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"
}
