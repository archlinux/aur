# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gstreamer0.10-good
pkgname=('gstreamer0.10-good-morituri' 'gstreamer0.10-good-plugins-morituri')
pkgver=0.10.31
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('intltool' 'pkgconfig' 'gstreamer0.10-base' 'flac' 'taglib' 'git')
url="http://gstreamer.freedesktop.org/"
source=("git://anongit.freedesktop.org/gstreamer-sdk/gst-plugins-good#commit=e28fd8886f05bb51c147f871f3a1db2fc2b735a9")
sha256sums=('SKIP')

prepare() {
    cd gst-plugins-good

    sed -i '/AC_PATH_XTRA/d' configure.ac
    sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
    cd gst-plugins-good
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-static --enable-experimental \
        --disable-schemas-install \
        --disable-gtk-doc \
        --disable-gconftool \
        --disable-videofilter \
        --disable-alpha \
        --disable-apetag \
        --disable-audiofx \
        --disable-audioparsers \
        --disable-auparse \
        --disable-autodetect \
        --disable-avi \
        --disable-cutter \
        --disable-debugutils \
        --disable-deinterlace \
        --disable-effectv \
        --disable-equalizer \
        --disable-flv \
        --disable-id3demux \
        --disable-icydemux \
        --disable-interleave \
        --disable-flx \
        --disable-goom \
        --disable-goom2k1 \
        --disable-imagefreeze \
        --disable-isomp4 \
        --disable-law \
        --enable-level \
        --disable-matroska \
        --disable-monoscope \
        --disable-multifile \
        --disable-multipart \
        --disable-replaygain \
        --disable-rtp \
        --disable-rtpmanager \
        --disable-rtsp \
        --disable-shapewipe \
        --disable-smpte \
        --disable-spectrum \
        --disable-udp \
        --disable-videobox \
        --disable-videocrop \
        --disable-videomixer \
        --enable-wavenc \
        --enable-wavparse \
        --disable-y4m \
        --disable-directsound \
        --disable-oss \
        --disable-oss4 \
        --disable-sunaudio \
        --disable-osx_audio \
        --disable-osx_video \
        --disable-gst_v4l2 \
        --disable-x \
        --disable-xshm \
        --disable-xvideo \
        --disable-aalib \
        --disable-annodex \
        --disable-cairo \
        --disable-cairo_gobject \
        --disable-esd \
        --disable-esdtest \
        --enable-flac \
        --disable-gconf \
        --disable-gdk_pixbuf \
        --disable-hal \
        --disable-jack \
        --disable-jpeg \
        --disable-libcaca \
        --disable-libdv \
        --disable-libpng \
        --disable-pulse \
        --disable-dv1394 \
        --disable-shout2 \
        --disable-soup \
        --disable-speex \
        --enable-taglib \
        --disable-wavpack \
        --disable-zlib \
        --disable-bz2 \
        --with-package-name="GStreamer Good Plugins (ArchLinux) – morituri version" \
        --with-package-origin="https://aur.archlinux.org/"

    make
    sed -e 's/gst sys ext/gst/' -i Makefile
}

package_gstreamer0.10-good-morituri() {
    depends=('gstreamer0.10-base') 
    pkgdesc="GStreamer Multimedia Framework Good plugin libraries, light version for morituri"
    conflicts=('gstreamer0.10-good')
    provides=('gstreamer0.10-good')

    cd gst-plugins-good

    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/etc/gconf"
}

package_gstreamer0.10-good-plugins-morituri() {
    depends=('gstreamer0.10-good' 'flac' 'taglib')
    pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good), light version for morituri"
    groups=('gstreamer0.10-plugins')
    conflicts=('gstreamer0.10-good-plugins')
    provides=('gstreamer0.10-good-plugins')

    cd gst-plugins-good
    make -C sys DESTDIR="${pkgdir}" install
    make -C ext GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}
