# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-opencv
_pkgname=gst-plugins-bad
pkgver=1.18.4
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenCV plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs opencv)
makedepends=(meson git)
_commit=8cb03bdf01ca6ad8c87f951bcd7962c3ca9f6860  # tags/1.18.4^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
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
