# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-openh264
_pkgname=gst-plugins-bad
pkgver=1.16.0
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenH264 plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs openh264)
makedepends=(meson)
_commit=5fde70bb63a1cbf6f734fb2429e74ffb53126217  # tags/1.16.0^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit"
        gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git
        "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/commit/d2f6facbfb89f13a891e710b44e1561570de006a.patch")
sha256sums=('SKIP'
            'SKIP'
            'df6ed6eca92a3ca49a0c98ca3ea2390a66801923d6dacb25765861a66e1fb14c')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  patch -Np1 < ../d2f6facbfb89f13a891e710b44e1561570de006a.patch
}

build() {
  arch-meson $_pkgname build \
    --auto-features=disabled \
    -D openh264=enabled \
    -D package-name="GStreamer Bad Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  ninja -C build
}

package() {
  install -Dm755 build/ext/openh264/libgstopenh264.so "$pkgdir"/usr/lib/gstreamer-1.0/libgstopenh264.so
}

# vim: ts=2 sw=2 et:
