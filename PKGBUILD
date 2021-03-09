# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ffmpeg
_pkgname=gst-ffmpeg
pkgver=0.10.13
pkgrel=11
pkgdesc="Gstreamer FFMpeg Plugin"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer0.10-base>=0.10.36-11' 'bzip2')
makedepends=('pkgconfig' 'yasm' 'sdl' 'git' 'gtk-doc')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
source=("https://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-0.10.13.tar.bz2"
        h264_qpel_mmx.patch)
sha256sums=('76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62'
            'd69ccc71a55063bc550ed7f7c838a7defb44a35270fdc1b3a276b516a6b55a88')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ../h264_qpel_mmx.patch
  find . -type f -print0 | xargs -0 sed -i 's/ORC_TARGET_ALTIVEC_ALTIVEC/ORC_TARGET_POWERPC_ALTIVEC/g'
}

build() {
  cd ${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --enable-gtk-doc --with-ffmpeg-extra-configure="--enable-runtime-cpudetect"
  make
}

# check() {
#   cd $_pkgname
#   make check
# }

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
