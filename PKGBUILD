# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-libav-git
_gitname=gst-libav
pkgver=1.3.1.1.1753.78b64cb
pkgrel=1
pkgdesc="Gstreamer libav Plugin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-base-git' 'bzip2')
makedepends=('yasm')
options=(!libtool !emptydirs)
provides=("gst-libav=$pkgver-$pkgrel" "gst-ffmpeg=$pkgver-$pkgrel")
conflicts=("gst-libav" "gst-ffmpeg")

source=('git://anongit.freedesktop.org/gstreamer/gst-libav')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(GStreamer libav, //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --with-libav-extra-configure="--enable-runtime-cpudetect"
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
