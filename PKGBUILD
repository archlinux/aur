# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo@1979gmail.com>

_pkgbase=gstreamer0.10-bad
pkgbase=lib32-$_pkgbase
pkgname=('lib32-gstreamer0.10-bad' 'lib32-gstreamer0.10-bad-plugins')
pkgver=0.10.23
pkgrel=6
arch=('x86_64')
license=('LGPL' 'GPL')
pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad) (32 bit)"
depends=('lib32-gstreamer0.10-base' "$_pkgbase")
makedepends=('gcc-multilib' 'lib32-libvdpau' 'lib32-libass' 'lib32-libcdaudio' 'lib32-curl' 'lib32-libdc1394' 'lib32-libdvdnav' 'lib32-libmms' 'lib32-liblrdf' 'lib32-libmpcdec' 'lib32-libmodplug' 'lib32-musicbrainz' 'lib32-neon' 'lib32-libofa' 'lib32-librsvg' 'lib32-schroedinger' 'lib32-soundtouch' 'lib32-rtmpdump' 'lib32-bzip2' 'lib32-libdca' 'lib32-faac' 'lib32-faad2' 'lib32-libsndfile' 'lib32-opus' 'lib32-celt' 'lib32-spandsp') #'xvidcore' 'mjpegtools' 'jasper' 'libvpx' 'gsm' 'libgme'

url="http://gstreamer.freedesktop.org/"
options=(!libtool !emptydirs)
source=($url/src/gst-plugins-bad/gst-plugins-bad-$pkgver.tar.xz)
md5sums=('e4822fa2cc933768e2998311a1565979')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd gst-plugins-bad-$pkgver
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  --disable-static --enable-experimental \
  --with-package-name="GStreamer Bad Plugins (Archlinux)" \
  --with-package-origin="http://www.archlinux.org/" \
  --libdir=/usr/lib32 \
  --disable-{kate,openal,sdl,teletextdec,opencv,lv2} \
  --disable-{voaacenc,voamrwbenc}

make
sed -e 's/gst sys ext/gst/' -i Makefile
}

package_lib32-gstreamer0.10-bad() {
pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad, lib32)"
depends=('lib32-gstreamer0.10-base')

cd gst-plugins-bad-$pkgver
make DESTDIR="$pkgdir" install
rm -rf "$pkgdir/usr"/{include,share}
}

package_lib32-gstreamer0.10-bad-plugins() {
pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-bad)"
depends=("lib32-gstreamer0.10-bad=${pkgver}" 'lib32-libdca' 'bzip2' 'lib32-libdc1394' 'lib32-neon' 'lib32-faac' 'lib32-musicbrainz' 'lib32-faad2' 'lib32-libmms' 'lib32-libcdaudio' 'lib32-libmpcdec' 'lib32-libdvdnav' 'lib32-libmodplug' 'lib32-liblrdf' 'lib32-libofa' 'lib32-libvdpau' 'lib32-soundtouch' 'lib32-libass' 'lib32-schroedinger' 'lib32-rtmpdump' 'lib32-libsndfile' 'lib32-librsvg' 'lib32-opus' 'lib32-celt' 'lib32-spandsp')

install=lib32-gstreamer0.10-bad-plugins.install

cd gst-plugins-bad-$pkgver
make -C gst-libs DESTDIR="${pkgdir}" install
make -C ext DESTDIR="${pkgdir}" install
make -C sys DESTDIR="${pkgdir}" install
make -C gst-libs DESTDIR="${pkgdir}" uninstall

rm -rf "$pkgdir/usr"/{include,share}

}


