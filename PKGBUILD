# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-opencv
_pkgname=gst-plugins-bad
pkgver=1.18.0
pkgrel=2
pkgdesc="GStreamer open-source multimedia framework OpenCV plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs opencv)
makedepends=(meson git)
_commit=7cb583bb0427819a6b59b783e7df67961df2155f  # tags/1.18.0^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit"
  "4.5.0.patch")
sha256sums=('SKIP'
  '59c4401641d619f6ca0fffd853dad0a2e027d3aba1698c81d5017a23e6ac6ff4')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../4.5.0.patch
}

build() {
  arch-meson $_pkgname build \
    --auto-features=disabled \
    -D opencv=enabled \
    -D package-name="GStreamer Bad Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  ninja -C build
}

package() {
  install -d "$pkgdir"/usr/lib
  find build/gst-libs/gst/opencv/*.so* -maxdepth 0 -type f | xargs cp -P -t "$pkgdir"/usr/lib/
  find build/gst-libs/gst/opencv/*.so* -maxdepth 0 -type l | xargs cp -P -t "$pkgdir"/usr/lib/
  install -Dm755 build/ext/opencv/libgstopencv.so "$pkgdir"/usr/lib/gstreamer-1.0/libgstopencv.so
}

# vim: ts=2 sw=2 et:
