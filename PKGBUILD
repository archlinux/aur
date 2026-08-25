# Maintainer: Han-Haocheng <1849397656@qq.com>
# Contributor: (add yours)
# libfprint 后端（GXFP 驱动 + SIGFM），源码 = Han-Haocheng/libfprint fork 固定 commit。
pkgname=libfprint-gxfp
pkgver=1.94.5
pkgrel=1
pkgdesc='libfprint with Goodix GXFP5130 eSPI support (SIGFM matching)'
arch=('x86_64')
url='https://github.com/Han-Haocheng/libfprint'
license=('LGPL-2.1-or-later')
depends=('gxfp5130' 'mbedtls3' 'glib2' 'libgusb' 'libgudev' 'opencv' 'fprintd')
makedepends=('meson' 'ninja' 'cmake' 'pkgconf')
provides=("libfprint=$pkgver" 'libfprint-2.so=2-64')
conflicts=('libfprint')
options=('!debug')

source=('libfprint-63b63f3.tar.gz::https://codeload.github.com/Han-Haocheng/libfprint/tar.gz/63b63f3290e990ba8b997f1dece36e8e9f5f5949')
sha256sums=('ce70010db87146bf2f823fead729c6efeb94884bafef12d32f8c8ce3c2b130d4')

build() {
  export PKG_CONFIG_PATH="${MBEDTLS3_PC:-/usr/lib/mbedtls3/pkgconfig}"
  meson setup "$srcdir/libfprint-63b63f3290e990ba8b997f1dece36e8e9f5f5949" "$srcdir/build" \
    --prefix=/usr \
    --buildtype=release \
    -Ddrivers=gxfp \
    -Ddoc=false \
    -Dgtk-examples=false \
    -Dintrospection=false \
    -Dudev_rules=disabled \
    -Dudev_hwdb=disabled
  meson compile -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/build"
}
