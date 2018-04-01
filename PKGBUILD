# Maintainer gCurse <gcurse at web dot de>
# Contributor Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer0.10-ugly
_pkgname=gst-plugins-ugly
pkgname=('gstreamer0.10-ugly' 'gstreamer0.10-ugly-plugins')
pkgver=0.10.19
pkgrel=28
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.10-base>=0.10.36-11' 'libdvdread' 'lame' 'libmpeg2' 'a52dec' 'libmad' 'libsidplay' 'libcdio' 'libx264' 'x264' 'opencore-amr')
url="https://gstreamer.freedesktop.org"
#source=("git+https://gitlab.com/gstreamer-sdk/$_pkgname.git#commit=d637756a8e569753e9869c2c0728288f5dbc5089"
source=("https://gstreamer.freedesktop.org/src/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        opencore-amr.patch
        cdio-cd-text-api.patch)
sha256sums=('4934f65ff892637e7efaf1cfe635779189dde429d0706f40c86a3aac476ea873'
            '6da7b11d0b6953b05262e0ebdcbfc1ac8ba82aae008ac8d06e68271d8f3f01af'
            '2a8aa4cd019fab333f1f8377bf7afa426d3038a033361d90fab70c335e9a53e7')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np0 -i ../opencore-amr.patch
  patch -Np1 -i ../cdio-cd-text-api.patch
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
}

build() {
  cd ${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-gtk-doc \
    --with-package-name="GStreamer Ugly Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"
  make
  sed -e 's/gst-libs gst ext/gst-libs gst/' -i Makefile
}

package_gstreamer0.10-ugly() {
  pkgdesc="GStreamer Multimedia Framework Ugly plugin libraries"
  depends=('gstreamer0.10-base>=0.10.36-11')
  
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_gstreamer0.10-ugly-plugins() {
  pkgdesc="GStreamer Multimedia Framework Ugly Plugins (gst-plugins-ugly)"
  depends=("gstreamer0.10-ugly=${pkgver}" 'libdvdread' 'lame' 'twolame' 'libmpeg2' 'a52dec' 'libmad' 'libsidplay' 'libcdio' 'libx264' 'opencore-amr')
  groups=('gstreamer0.10-plugins')
  replaces=('gstreamer0.10-dvdread' 'gstreamer0.10-mpeg2dec' 'gstreamer0.10-mad' 'gstreamer0.10-lame' 'gstreamer0.10-sidplay' 'gstreamer0.10-a52dec')
  conflicts=('gstreamer0.10-dvdread' 'gstreamer0.10-mpeg2dec' 'gstreamer0.10-mad' 'gstreamer0.10-lame' 'gstreamer0.10-sidplay' 'gstreamer0.10-a52dec')

  cd ${_pkgname}-${pkgver}
  make -C ext DESTDIR="${pkgdir}" install
}
