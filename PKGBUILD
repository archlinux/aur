# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname='gst-plugins-base-git'
pkgver=1.16.0.r280.g2c7445b9c
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pkgconfig'  'git' 'gstreamer-git'
             'orc' 'libxv' 'alsa-lib' 'cdparanoia'
             'libvisual' 'libvorbis' 'libtheora' 'glu'
             'pango' 'gobject-introspection' 'meson')
options=()
url="http://gstreamer.freedesktop.org/"

conflicts=('gst-plugins-base' 'gst-plugins-base-libs')
provides=('gst-plugins-base='$pkgver 'gst-plugins-base-libs='$pkgver)

pkgdesc="GStreamer Multimedia Framework Base Plugins"
depends=('gstreamer-git' 'orc' 'libxv' 'opus' 'gdk-pixbuf2'
        'alsa-lib' 'cdparanoia' 'libjpeg-turbo' 'gtk3' 'graphene'
        'libvisual' 'libvorbis' 'libtheora' 'pango' 'libtremor-svn' 'sdl2' 'qt5-base')

source=('git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git'
        'gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')



pkgver() {
  cd gst-plugins-base
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gst-plugins-base
  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update
}

build() {
  arch-meson gst-plugins-base build \
    -Ddoc=disabled \
    -Dgobject-cast-checks=disabled \
    -Dglib-asserts=disabled \
    -Dglib-checks=disabled \
    -Dpackage-name="GStreamer Base Plugins (Arch Linux)" \
    -Dpackage-origin="https://aur.archlinux.org/"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

