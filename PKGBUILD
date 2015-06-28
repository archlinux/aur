# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo@1979gmail.com>

_pkgbase=gstreamer0.10-bad
pkgbase=lib32-$_pkgbase
pkgname=('lib32-gstreamer0.10-bad' 'lib32-gstreamer0.10-bad-plugins')
pkgver=0.10.23
pkgrel=7
arch=('x86_64')
license=('LGPL' 'GPL')
pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad) (32 bit)"
depends=('lib32-gstreamer0.10-base' "$_pkgbase")
makedepends=('gcc-multilib' 'lib32-libvdpau' 'lib32-libass' 'lib32-libcdaudio' 'lib32-curl' 'lib32-libdc1394' 'lib32-libdvdnav' 'lib32-libmms' 'lib32-liblrdf' 'lib32-libmpcdec' 'lib32-libmodplug' 'lib32-musicbrainz' 'lib32-neon' 'lib32-libofa' 'lib32-librsvg' 'lib32-schroedinger' 'lib32-soundtouch' 'lib32-rtmpdump' 'lib32-bzip2' 'lib32-libdca' 'lib32-faac' 'lib32-faad2' 'lib32-libsndfile' 'lib32-opus' 'lib32-celt' 'lib32-spandsp') #'xvidcore' 'mjpegtools' 'jasper' 'libvpx' 'gsm' 'libgme'

url="http://gstreamer.freedesktop.org/"
options=(!libtool !emptydirs)
source=("git://anongit.freedesktop.org/gstreamer-sdk/gst-plugins-bad#commit=57569a4854a0f2d14ef19a8264a4ae9a7a1d1125"
fix-libmodplug-include.patch
drop-vpx-compat-defs.patch
disable-assrender-test.patch
disable-camerabin-test.patch
faad2-version-check.patch)

md5sums=('SKIP'
         '447c12a784b13aac9e47e48741d26a67'
         '476a02484af2e9bdc1cb4a703b531cec'
         '025438e630b571bfa90171e36d4240e5'
         '2e17f524b0db1469cfa36703bf459153'
         'dfa7e5723542d0fabebf509cb321535b')

prepare() {
cd gst-plugins-bad
sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
patch -Np1 -i ../fix-libmodplug-include.patch
patch -Np1 -i ../drop-vpx-compat-defs.patch
patch -Np1 -i ../disable-assrender-test.patch
patch -Np1 -i ../disable-camerabin-test.patch
patch -Np1 -i ../faad2-version-check.patch
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd gst-plugins-bad
NOCONFIGURE=1 ./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  --disable-static --enable-experimental --disable-gtk-doc \
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

cd gst-plugins-bad
make DESTDIR="$pkgdir" install
rm -rf "$pkgdir/usr"/{include,share}
}

package_lib32-gstreamer0.10-bad-plugins() {
pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-bad)"
depends=("lib32-gstreamer0.10-bad=${pkgver}" 'lib32-libdca' 'bzip2' 'lib32-libdc1394' 'lib32-neon' 'lib32-faac' 'lib32-musicbrainz' 'lib32-faad2' 'lib32-libmms' 'lib32-libcdaudio' 'lib32-libmpcdec' 'lib32-libdvdnav' 'lib32-libmodplug' 'lib32-liblrdf' 'lib32-libofa' 'lib32-libvdpau' 'lib32-soundtouch' 'lib32-libass' 'lib32-schroedinger' 'lib32-rtmpdump' 'lib32-libsndfile' 'lib32-librsvg' 'lib32-opus' 'lib32-celt' 'lib32-spandsp')

install=lib32-gstreamer0.10-bad-plugins.install

cd gst-plugins-bad
make -C gst-libs DESTDIR="${pkgdir}" install
make -C ext DESTDIR="${pkgdir}" install
make -C sys DESTDIR="${pkgdir}" install
make -C gst-libs DESTDIR="${pkgdir}" uninstall

rm -rf "$pkgdir/usr"/{include,share}

}


