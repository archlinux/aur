# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gst-plugins-bad
pkgname=${_pkgname}-glonly
pkgver=1.12.4
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins, gl plugin only for webkit2gtk"
url="https://gstreamer.freedesktop.org/"
arch=('i686' 'x86_64')
license=('LGPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('gst-plugins-base-libs' 'mesa')
makedepends=('git' 'python')
_commit=cbdbd8d4f6893e6042dbf7b8258e23a8d2aaf081 # tags/1.12.4^0
source=("git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad#commit=$_commit"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd ${_pkgname}

    git submodule init
    git config --local submodule.common.url "$srcdir/gst-common"
    git submodule update

    sed -i 's/cmu_us_kal/&16/g' configure.ac ext/flite/gstflitetestsrc.c

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd ${_pkgname}

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
        --with-package-name="GStreamer Bad Plugins (Arch Linux)" \
        --with-package-origin="https://www.archlinux.org/" \
        --with-gtk=3.0 \
        --disable-experimental \
        --disable-gtk-doc \
        --disable-static \
        --enable-gl \
        --enable-opengl \
        --enable-gles2 \
        --enable-egl \
        --enable-glx \
        --enable-x11 \
        --enable-wayland \
        --disable-accurip \
        --disable-adpcmdec \
        --disable-adpcmenc \
        --disable-aiff \
        --disable-videoframe_audiolevel \
        --disable-asfmux \
        --disable-audiobuffersplit \
        --disable-audiofxbad \
        --disable-audiomixer \
        --disable-audiomixmatrix \
        --disable-compositor \
        --disable-audiovisualizers \
        --disable-autoconvert \
        --disable-bayer \
        --disable-camerabin2 \
        --disable-coloreffects \
        --disable-debugutils \
        --disable-dvbsuboverlay \
        --disable-dvdspu \
        --disable-faceoverlay \
        --disable-festival \
        --disable-fieldanalysis \
        --disable-freeverb \
        --disable-frei0r \
        --disable-gaudieffects \
        --disable-geometrictransform \
        --disable-gdp \
        --disable-id3tag \
        --disable-inter \
        --disable-interlace \
        --disable-ivfparse \
        --disable-ivtc \
        --disable-jp2kdecimator \
        --disable-jpegformat \
        --disable-librfb \
        --disable-midi \
        --disable-mpegdemux \
        --disable-mpegtsdemux \
        --disable-mpegtsmux \
        --disable-mpegpsmux \
        --disable-mxf \
        --disable-netsim \
        --disable-onvif \
        --disable-pcapparse \
        --disable-pnm \
        --disable-rawparse \
        --disable-removesilence \
        --disable-sdp \
        --disable-segmentclip \
        --disable-siren \
        --disable-smooth \
        --disable-speed \
        --disable-subenc \
        --disable-stereo \
        --disable-timecode \
        --disable-videofilters \
        --disable-videoparsers \
        --disable-videosignal \
        --disable-vmnc \
        --disable-y4m \
        --disable-yadif \
        --disable-dispmanx \
        --disable-directsound \
        --disable-wasapi \
        --disable-direct3d \
        --disable-winscreencap \
        --disable-winks \
        --disable-android_media \
        --disable-apple_media \
        --disable-bluez \
        --disable-avc \
        --disable-shm \
        --disable-vcd \
        --disable-opensles \
        --disable-uvch264 \
        --disable-nvenc \
        --disable-tinyalsa \
        --disable-msdk \
        --disable-assrender \
        --disable-voamrwbenc \
        --disable-voaacenc \
        --disable-bs2b \
        --disable-bz2 \
        --disable-chromaprint \
        --disable-curl \
        --disable-dash \
        --disable-dc1394 \
        --disable-decklink \
        --disable-directfb \
        --disable-wayland \
        --disable-webp \
        --disable-daala \
        --disable-dts \
        --disable-resindvd \
        --disable-faac \
        --disable-faad \
        --disable-fbdev \
        --disable-fdk_aac \
        --disable-flite \
        --disable-gsm \
        --disable-fluidsynth \
        --disable-kate \
        --disable-kms \
        --disable-ladspa \
        --disable-lv2 \
        --disable-libde265 \
        --disable-libmms \
        --disable-srtp \
        --disable-dtls \
        --disable-ttml \
        --disable-modplug \
        --disable-mpeg2enc \
        --disable-mplex \
        --disable-musepack \
        --disable-neon \
        --disable-ofa \
        --disable-openal \
        --disable-opencv \
        --disable-openexr \
        --disable-openh264 \
        --disable-openjpeg \
        --disable-openni2 \
        --disable-opus \
        --disable-rsvg \
        --disable-gtk3 \
        --disable-qt \
        --disable-vulkan \
        --disable-teletextdec \
        --disable-wildmidi \
        --disable-smoothstreaming \
        --disable-sndfile \
        --disable-soundtouch \
        --disable-spc \
        --disable-gme \
        --disable-dvb \
        --disable-acm \
        --disable-vdpau \
        --disable-sbc \
        --disable-schro \
        --disable-zbar \
        --disable-rtmp \
        --disable-spandsp \
        --disable-hls \
        --disable-x265 \
        --disable-webrtcdsp

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    cd ${_pkgname}
    # bad tests are bad
    #make -k check || :
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}
