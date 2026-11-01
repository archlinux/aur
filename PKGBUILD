# Maintainer: Han-Haocheng <1849397656@qq.com>
# Contributor: (add yours)
# libfprint 后端（GXFP 驱动 + SIGFM）。
# 源码 = 上游 Metrohan/gxfp5130-linux 发布 tag 里的 libfprint/ 子树（Void755/libfprint 血统）。
# pkgver 保持 libfprint 项目版本 1.94.5；_gxfp_srcver 记录源码所在的 gxfp 栈 tag。
pkgname=libfprint-gxfp
pkgver=1.94.5
pkgrel=3
pkgdesc='libfprint with Goodix GXFP5130 eSPI support (SIGFM matching)'
arch=('x86_64')
url='https://github.com/Metrohan/gxfp5130-linux'
license=('LGPL-2.1-or-later')
depends=('gxfp5130' 'mbedtls3' 'glib2' 'libgusb' 'libgudev' 'opencv' 'fprintd')
makedepends=('meson' 'ninja' 'cmake' 'pkgconf' 'doctest' 'glib2-devel')
provides=("libfprint=$pkgver" 'libfprint-2.so=2-64')
conflicts=('libfprint')
options=('!debug')

_gxfp_srcver=0.2.0
source=("libfprint-gxfp.tar.gz::https://github.com/Metrohan/gxfp5130-linux/archive/refs/tags/v${_gxfp_srcver}.tar.gz")
sha256sums=('264a0e04a9128e7c9e7c089be50fc12602f9beb453897c22957d288561ab7b8f')

build() {
  export PKG_CONFIG_PATH="/usr/lib/mbedtls3/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
  meson setup "$srcdir/gxfp5130-linux-${_gxfp_srcver}/libfprint" "$srcdir/build" \
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
