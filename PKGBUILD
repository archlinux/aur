# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-libav-git
_gitname=gst-libav
pkgver=1.17.0.1.2232.e3e99dd
pkgrel=1
pkgdesc="Gstreamer libav Plugin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer-git' 'gst-plugins-base-git' 'bzip2' 'ffmpeg')
makedepends=('yasm' 'git' 'gtk-doc' 'meson' 'ninja' 'hotdoc' )
options=(!emptydirs)
provides=("gst-libav" "gst-ffmpeg")
conflicts=("gst-libav" "gst-ffmpeg")

source=('git+https://gitlab.freedesktop.org/gstreamer/gst-libav.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(GStreamer libav, //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

prepare() {
 cd $_gitname
 git submodule update --init --recursive


}
build() {
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'
  arch-meson $_gitname build \
    -Dpackage-name="GStreamer FFMPEG Plugin (Arch Linux)" \
    -Dpackage-origin="https://www/archlinux.org/" \
    -Ddoc=disabled

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
