# Maintainer 
# Contributor gCurse <gcurse at web dot de>
# Contributor Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer0.10-bad
_pkgname=gst-plugins-bad
pkgname=('gstreamer0.10-bad' 'gstreamer0.10-bad-plugins')
pkgver=0.10.23
pkgrel=38
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL' 'GPL')
makedepends=('pkgconfig' 'gstreamer0.10-base>=0.10.36-11' 'xvidcore' 'libdca'
             'bzip2' 'libdc1394' 'neon' 'faac' 'libmusicbrainz5' 'faad2'
             'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav'
             'libmodplug' 'jasper' 'liblrdf' 'libofa' 'soundtouch' 'libvdpau'
             'schroedinger' 'libass' 'libvpx' 'gsm' 'libgme' 'rtmpdump'
             'libsndfile' 'librsvg' 'wildmidi' 'opus' 'git' 'spandsp' 'celt'
             'openssl-1.0')
url="http://gstreamer.freedesktop.org/"
options=(!emptydirs)
source=("https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.23.tar.xz"
        fix-libmodplug-include.patch
        drop-vpx-compat-defs.patch
        disable-assrender-test.patch
        disable-camerabin-test.patch
        faad2-version-check.patch
        wildmidi-0.4.patch
        flite_cmu_us_kal.patch)
sha256sums=('03cf0786391c64625569072e904082a08861f05a63d64b2f8e8dad3f26d81bf9'
            'd89d8f4307c7d5a143b9240467d260a1cb6bb1ab2e7ca57841ce0901f41c9cb7'
            'eb97037b7b581d1ab994eadd144044c083975e5670a73ec827de126bf888f4b9'
            'e66642affa6c0e69837d37615010e67e59ef3d672663303d46c1e2591e2ddfc6'
            '01e780ddf1f8161a6115dded9dc5bf4bdd4d09a9eee00fa423b1330e90e76c68'
            '741492ae7a9518603fc51d87ae331d882f075547ea7fdec19c60f399085f18cc'
            '7a8698df3b53c34c627c00d3b025045818898cedc5ee7ffa13272d8758fcefd2'
            'e3b6a6a8bd0480ab812116cb472b92ad5770fdb8afdbdc2a5b557fdd0294ad36')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
  patch -Np1 -i ../fix-libmodplug-include.patch
  patch -Np1 -i ../drop-vpx-compat-defs.patch
  patch -Np1 -i ../disable-assrender-test.patch
  patch -Np1 -i ../disable-camerabin-test.patch
  patch -Np1 -i ../faad2-version-check.patch
  patch -Np1 -i ../wildmidi-0.4.patch
  patch -Np1 -i ../flite_cmu_us_kal.patch
  find . -type f -name '*glib-gen.mak' -print0 | xargs -0 sed -i 's/\\n\\#include/\\n#include/g'
}

build() {
  cd ${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  CPPFLAGS=-I/usr/include/openssl-1.0 LDFLAGS=-L/usr/lib/openssl-1.0 \
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-gtk-doc \
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  sed -e 's/gst sys ext/gst/' -i Makefile
}

package_gstreamer0.10-bad() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad)"
  depends=('gstreamer0.10-base>=0.10.36-11')

  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_gstreamer0.10-bad-plugins() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-bad)"
  depends=("gstreamer0.10-bad=${pkgver}" 'xvidcore' 'libdca' 'bzip2' 'libdc1394'
          'neon' 'faac' 'libmusicbrainz5' 'faad2' 'libmms' 'libcdaudio' 'libmpcdec'
          'mjpegtools' 'libdvdnav' 'libmodplug' 'jasper' 'liblrdf' 'libofa'
          'libvdpau' 'soundtouch' 'libass' 'schroedinger' 'libvpx' 'gsm' 'rtmpdump'
          'libgme' 'libsndfile' 'librsvg' 'wildmidi' 'opus' 'celt' 'spandsp'
          'openssl-1.0' 'dconf')
  groups=('gstreamer0.10-plugins')

  cd ${_pkgname}-${pkgver}
  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C sys DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall
}
