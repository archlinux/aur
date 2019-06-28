# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-opencv
_pkgname=gst-plugins-bad
pkgver=1.16.0
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenCV plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs opencv)
makedepends=(meson)
_commit=5fde70bb63a1cbf6f734fb2429e74ffb53126217  # tags/1.16.0^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit"
        'gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git'
        'https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/commit/49a2baebf58d9288f75964fc40a547fde510a840.patch'
        'https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/commit/22c6a4085f8792d8af0cdabfe1664d55ca2dee11.patch')
sha256sums=('SKIP'
            'SKIP'
            'eb15c299087de3466b8fc6c3388d4aec16a5999248ffd9053cef884e58ec2992'
            '722a31287a67e33e874a26976dd1cd4151b32da54a9650072edc9d72528a9ee1')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  patch -Np1 < ../49a2baebf58d9288f75964fc40a547fde510a840.patch
  patch -Np1 < ../22c6a4085f8792d8af0cdabfe1664d55ca2dee11.patch
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
