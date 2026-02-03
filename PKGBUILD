# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libdvdread-git
pkgname=(
  'libdvdread-git'
  'lib32-libdvdread-git'
)
pkgver=7.0.1.37.ge294cf7
pkgrel=1
pkgdesc="Library to access DVD disks. (GIT version)"
arch=('x86_64')
license=('GPL2')
url='https://dvdnav.mplayerhq.hu'
makedepends=(
  'git'
  'glibc'
  'lib32-glibc'
  'libdvdcss'
  'lib32-libdvdcss'
  'meson'
)
provides=('libdvdread.so')
source=('git+https://code.videolan.org/videolan/libdvdread.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdread
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd libdvdread

  arch-meson . build \
    -D libdvdcss=enabled

  meson compile -C build

  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson . build32 \
    --cross-file lib32 \
    -D libdvdcss=enabled

  meson compile -C build32
}

package_libdvdread-git() {
  depends+=(
    'libdvdcss.so'
    'glibc'
  )
  provides+=('libdvdread')
  conflicts=('libdvdread')

  meson install -C libdvdread/build --destdir "${pkgdir}"
}

package_lib32-libdvdread-git() {
  pkgdesc=" (32-bits)"
  depends+=(
    'libdvdcss.so'
    'lib32-glibc'
  )
  provides+=('lib32-libdvdread')
  conflicts=('lib32-libdvdread')

  meson install -C libdvdread/build32 --destdir "${pkgdir}"

  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"
}
