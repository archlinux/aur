# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-libav-git
_gitname=gst-libav
pkgver=1.15.0.1.2144.43bda46
pkgrel=1
pkgdesc="Gstreamer libav Plugin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer-git' 'gst-plugins-base-git' 'bzip2')
makedepends=('yasm' 'git' 'gtk-doc')
options=(!emptydirs)
provides=("gst-libav=$pkgver-$pkgrel" "gst-ffmpeg=$pkgver-$pkgrel")
conflicts=("gst-libav" "gst-ffmpeg")

source=('git://anongit.freedesktop.org/gstreamer/gst-libav'
        'Port-To-FFMPEG-4.patch')
sha256sums=('SKIP'
            '0bc52e3ba4495cecca5bb83004ea4d248cb8694fd3a2e6ea7270578ee06f46b2')

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
 patch -Np1 -i ../Port-To-FFMPEG-4.patch

 NOCONFIGURE=1 ./autogen.sh

}
build() {
  cd $_gitname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --with-libav-extra-configure="--enable-runtime-cpudetect"
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
