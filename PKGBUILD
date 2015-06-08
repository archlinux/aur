# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgbase=lib32-gstreamer0.10-ugly
_pkgbase=gstreamer0.10-ugly
pkgname=('lib32-gstreamer0.10-ugly' 'lib32-gstreamer0.10-ugly-plugins')
pkgver=0.10.19
pkgrel=7
arch=('x86_64')
license=('LGPL')
makedepends=('gstreamer0.10-ugly' 'gstreamer0.10-ugly-plugins' 'pkgconfig' 'lib32-gstreamer0.10-base>=0.10.34' 'lib32-libdvdread' 'lib32-lame' 'lib32-libmpeg2' 'lib32-a52dec' 'lib32-libmad' 'lib32-libsidplay' 'lib32-libcdio' 'lib32-libx264' 'lib32-opencore-amr' 'git')
url="http://gstreamer.freedesktop.org/"
source=("git://anongit.freedesktop.org/gstreamer-sdk/gst-plugins-ugly#commit=d637756a8e569753e9869c2c0728288f5dbc5089"
        opencore-amr.patch
        cdio-cd-text-api.patch)
md5sums=('SKIP'
         'd8feb6c99bfaff8be6b2c48ea4e98e47'
         '6c1c665f864387f3a77d32231fedeaab')


prepare() {
cd gst-plugins-ugly
patch -Np0 -i ../opencore-amr.patch
patch -Np1 -i ../cdio-cd-text-api.patch
sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
}

build() {
cd gst-plugins-ugly
NOCONFIGURE=1 ./autogen.sh
./configure --libdir=/usr/lib32 --libexecdir=/usr/lib32 \
    --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-gtk-doc \
    --with-package-name="GStreamer Ugly Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"
  make
  sed -e 's/gst-libs gst ext/gst-libs gst/' -i Makefile
}

check() {
cd gst-plugins-ugly
make check
}

package_lib32-gstreamer0.10-ugly() {
pkgdesc="GStreamer Multimedia Framework Ugly plugin libraries, lib32"
depends=('lib32-gstreamer0.10-base>=0.10.34')
  
cd gst-plugins-ugly
make DESTDIR="${pkgdir}" install
cd "$pkgdir/usr"
rm -rf share/
}

package_lib32-gstreamer0.10-ugly-plugins() {
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (gst-plugins-ugly), lib32"
depends=("lib32-gstreamer0.10-ugly=${pkgver}" 'lib32-libdvdread' 'lib32-lame' 'lib32-libmpeg2' 'lib32-a52dec' 'lib32-libmad' 'lib32-libsidplay' 'lib32-libcdio' 'lib32-libx264' 'lib32-opencore-amr')
conflicts=("lib32-gstreamer0.10-ugly-plugins")
replaces=("lib32-gstreamer0.10-ugly-plugins")

cd gst-plugins-ugly
make -C ext DESTDIR="${pkgdir}" install
cd "$pkgdir/usr"
rm -rf share/
}
