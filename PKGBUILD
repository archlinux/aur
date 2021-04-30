# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=gst-plugins-bad-git
pkgver=1.18.0.r970.g4900e3583
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-plugins-bad='$pkgver)
conflicts=('gst-plugins-bad' 'gst-plugins-gl' 'gst-plugins-bad-libs')
url="http://gstreamer.freedesktop.org/"
depends=('mjpegtools' 'gst-plugins-base-git' 'curl'
        'chromaprint' 'libmms' 'faad2' 'mpg123'
        'faac' 'celt' 'libdca' 'soundtouch' 'spandsp'
        'libdvdnav' 'libmodplug' 'libgme' 'opus'
        'wayland' 'rtmpdump' 'opencv' 'vulkan-headers'
        'bluez-libs' 'intel-media-sdk' 'libbs2b' 'libfdk-aac'
        'fluidsynth' 'dssim' 'libkate' 'liblrdf'
        'ladspa' 'libde265' 'libmicrodns' 'libmpcdec'
        'neon' 'libofa' 'openal' 'openh264'
        'libopenmpt' 'openni2' 'sbc' 'srt' 'libsrtp'
        'zvbi' 'vo-aacenc' 'vo-amrwbenc'  'shaderc'
        'libnice' 'webrtc-audio-processing' 'wildmidi'
        'zbar' 'lilv-git' 'vulkan-icd-loader'
        'libldac' 'libopenaptx'
      )
makedepends=('git' 'meson' 'schroedinger'
             'libexif' 'libdvdread' 'lilv-git'
            'libvdpau' 'libmpeg2'
            'gtk-doc' 'glu' 'gobject-introspection')
options=(!emptydirs)

source=('git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad.git'
        'gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

_gitname='gst-plugins-bad'

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update

  # openexr 2.4 requires c++11
  sed -e "s|'-std=c++98'||" -i ext/openexr/meson.build
}

build() {
  arch-meson $_gitname build \
    -Dopensles=disabled \
    -Dtinyalsa=disabled \
    -Dwasapi=disabled \
    -Davtp=disabled \
    -Ddirectfb=disabled \
    -Dflite=disabled \
    -Dsctp=disabled \
    -Dwpe=disabled \
    -Ddoc=disabled \
    -Dmagicleap=disabled \
    -Dwasapi2=disabled \
    -Disac=disabled \
    -Dzxing=disabled \
    -Dpackage-name="GStreamer Bad Plugins (Arch Linux)" \
    -Dpackage-origin="https://www.archlinux.org/"
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}
