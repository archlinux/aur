# Maintainer Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer0.10-good
_pkgname=gst-plugins-good
pkgname=('gstreamer0.10-good' 'gstreamer0.10-good-plugins')
pkgver=0.10.31
pkgrel=17
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')
makedepends=('intltool' 'pkgconfig' 'gstreamer0.10-base>=0.10.36-3' 'libavc1394' 'libiec61883' 'aalib' 'libshout' 'libdv' 'flac' 'gconf' 'wavpack' 'taglib' 'libsoup-gnome' 'v4l-utils' 'libcaca' 'bzip2' 'gdk-pixbuf2' 'libpulse' 'jack' 'git' 'cairo' 'libgudev')
url="http://gstreamer.freedesktop.org/"
options=(!emptydirs)
source=("git+https://gitlab.com/gstreamer-sdk/$_pkgname.git#commit=e28fd8886f05bb51c147f871f3a1db2fc2b735a9"
        'test-rtp-payloading.patch'
        'souptest.patch')
sha256sums=('SKIP'
            'c2f7f07f9bf5ca3afddc81d0a44665d2d54b1e9aea0ef1b25d219cf34bf7bb29'
            '3a74492c3d2939efabe7e22211c2350084e0a8cc3af23f553130f1e774c5f1e1')

prepare() {
  cd $_pkgname

  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  patch -Np1 -i ../test-rtp-payloading.patch
  patch -Np1 -i ../souptest.patch
}

build() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --disable-schemas-install \
    --disable-hal \
    --disable-esd \
    --disable-gtk-doc \
    --with-package-name="GStreamer Good Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
  sed -e 's/gst sys ext/gst/' -i Makefile
}

package_gstreamer0.10-good() {
  depends=('gstreamer0.10-base>=0.10.34' 'bzip2')
  pkgdesc="GStreamer Multimedia Framework Good plugin libraries"

  cd $_pkgname
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/etc/gconf"
}

package_gstreamer0.10-good-plugins() {
  depends=("gstreamer0.10-good=${pkgver}" 'libavc1394' 'libiec61883' 'aalib' 'libshout' 'libdv' 'flac' 'gconf' 'wavpack' 'taglib' 'libsoup-gnome' 'v4l-utils' 'libcaca' 'libpng' 'libjpeg' 'jack' 'libpulse' 'cairo' 'gdk-pixbuf2' 'libgudev')
  pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good)"
  groups=('gstreamer0.10-plugins')
  replaces=('gstreamer0.10-aalib' 'gstreamer0.10-wavpack' 'gstreamer0.10-shout2' 'gstreamer0.10-taglib' 'gstreamer0.10-libcaca' 'gstreamer0.10-libpng' 'gstreamer0.10-jpeg' 'gstreamer0.10-cairo' 'gstreamer0.10-flac' 'gstreamer0.10-speex' 'gstreamer0.10-gdkpixbuf' 'gstreamer0.10-dv1394' 'gstreamer0.10-annodex' 'gstreamer0.10-gconf' 'gstreamer0.10-esd' 'gstreamer0.10-cdio' 'gstreamer0.10-dv' 'gstreamer0.10-soup' 'gstreamer0.10-pulse')
  conflicts=('gstreamer0.10-aalib' 'gstreamer0.10-wavpack' 'gstreamer0.10-shout2' 'gstreamer0.10-taglib' 'gstreamer0.10-libcaca' 'gstreamer0.10-libpng' 'gstreamer0.10-jpeg' 'gstreamer0.10-cairo' 'gstreamer0.10-flac' 'gstreamer0.10-speex' 'gstreamer0.10-gdkpixbuf' 'gstreamer0.10-dv1394' 'gstreamer0.10-annodex' 'gstreamer0.10-gconf' 'gstreamer0.10-esd' 'gstreamer0.10-cdio' 'gstreamer0.10-dv' 'gstreamer0.10-bad-plugins<0.10.7' 'gstreamer0.10-soup' 'gstreamer0.10-pulse')

  cd $_pkgname
  make -C sys DESTDIR="${pkgdir}" install
  make -C ext GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  install -m644 gconf/gstreamer-0.10.schemas "${pkgdir}/usr/share/gconf/schemas/gstreamer0.10-good-plugins.schemas"
}
