# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-opencv
_pkgname=gst-plugins-bad
pkgver=1.16.2
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenCV plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs opencv)
makedepends=(meson)
_commit=a6f26408f74a60d02ce6b4f0daee392ce847055f  # tags/1.16.2^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
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
  find build/gst-libs/gst/opencv/*.so* | xargs cp -P -t "$pkgdir"/usr/lib/
  install -Dm755 build/ext/opencv/libgstopencv.so "$pkgdir"/usr/lib/gstreamer-1.0/libgstopencv.so
}

# vim: ts=2 sw=2 et:
