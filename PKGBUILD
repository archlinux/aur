# Maintainer: GordonGR <gordongr@freemail.gr>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-gstreamer0.10-good
_pkgbase=gstreamer0.10-good
pkgname=('lib32-gstreamer0.10-good' 'lib32-gstreamer0.10-good-plugins')
_pkgname=('gstreamer0.10-good' 'gstreamer0.10-good-plugins')
pkgver=0.10.31
pkgrel=4
arch=('x86_64')
license=('LGPL')
depends=('gstreamer0.10-good' 'gstreamer0.10-good-plugins' "lib32-gstreamer0.10-base")
makedepends=('intltool' 'pkgconfig' 'libavc1394' 'libiec61883' 'aalib' 'lib32-libshout' 'lib32-libdv' 'lib32-flac' 'lib32-gconf' 'lib32-wavpack' 'lib32-taglib' 'lib32-libsoup' 'lib32-v4l-utils' 'lib32-libcaca' 'lib32-bzip2' 'lib32-gdk-pixbuf2' 'lib32-libpulse' 'lib32-jack' 'git' 'lib32-cairo')
url="http://gstreamer.freedesktop.org/"
options=(!emptydirs)
source=("git://anongit.freedesktop.org/gstreamer-sdk/gst-plugins-good#commit=e28fd8886f05bb51c147f871f3a1db2fc2b735a9"
        "test-rtp-payloading.patch")
md5sums=('SKIP'
         '6781763eb752d57f3d111a41905d25bd')
         
prepare() {
cd gst-plugins-good
sed -i '/AC_PATH_XTRA/d' configure.ac
sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
patch -p1 -i ../test-rtp-payloading.patch
}

build() {
export CC="gcc -m32 -march=i686"
export CXX="g++ -m32 -march=i686"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

cd gst-plugins-good
NOCONFIGURE=1 ./autogen.sh
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  --disable-static --enable-experimental \
  --disable-schemas-install \
  --disable-hal \
  --disable-esd \
  --disable-gtk-doc \
  --libdir=/usr/lib32/ \
  --build=i686-unknown-linux-gnu \
  --with-package-name="GStreamer Good Plugins (Archlinux)" \
  --with-package-origin="http://www.archlinux.org/"

make
sed -e 's/gst sys ext/gst/' -i Makefile
}

#check() {
#cd gst-plugins-good
#make check
#}

package_lib32-gstreamer0.10-good() {
depends=('lib32-gstreamer0.10-base>=0.10.34' 'lib32-bzip2')
pkgdesc="GStreamer Multimedia Framework Good plugin libraries (lib32)"

cd gst-plugins-good
make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/etc/gconf"
rm -rf "${pkgdir}/usr/share/"
}

package_lib32-gstreamer0.10-good-plugins() {
depends=("gstreamer0.10-good" 'libavc1394' 'libiec61883' 'aalib' 'lib32-libshout' 'lib32-libdv' 'lib32-flac' 'lib32-gconf' 'lib32-wavpack' 'lib32-taglib' 'lib32-libsoup' 'lib32-v4l-utils' 'lib32-libcaca' 'lib32-libpng' 'lib32-libjpeg-turbo' 'lib32-jack' 'lib32-libpulse' 'lib32-cairo' 'lib32-gdk-pixbuf2')
pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good, lib32)"
install=lib32-gstreamer0.10-good-plugins.install
conflicts=("lib32-gstreamer0.10-good-plugins")
replaces=("lib32-gstreamer0.10-good-plugins")

cd gst-plugins-good
make -C sys DESTDIR="${pkgdir}" install
make -C ext GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}

