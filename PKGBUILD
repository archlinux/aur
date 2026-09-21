# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=baresip-qt-gui-git
pkgver=4.10.0_qt1.r4740.g267d13dd
pkgrel=1
pkgdesc="Baresip bundled with custom native Qt applet and simple call interface for KDE Plasma6 (Wayland)"
arch=('x86_64')
url="https://github.com/CxOrg/baresip-qt"
license=('BSD-3-Clause')

depends=('qt6-base' 'layer-shell-qt' 'kconfigwidgets' 'libre' 'openssl'
         'opus' 'frameworkintegration' 'bash')
# Module libraries are listed in makedepends so every build produces
# the complete module set (each module's CMakeLists auto-skips when a
# dep is missing — without this the package contents would vary by
# build machine). They are optdepends at runtime: modules are
# dlopen'd and only needed if enabled in ~/.baresip/config.
makedepends=('cmake' 'git'
             'alsa-lib' 'libpulse' 'libpipewire' 'jack2' 'portaudio'
             'libfdk-aac' 'opencore-amr' 'codec2' 'gsm' 'spandsp'
             'aom' 'libvpx' 'ffmpeg' 'gstreamer' 'gst-plugins-base'
             'sdl2' 'libx11' 'libxext' 'libpng' 'libsndfile'
             'v4l-utils' 'glib2' 'mosquitto' 'libsrtp'
             'webrtc-audio-processing-1')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'libpipewire: PipeWire audio driver'
            'jack2: JACK audio driver'
            'portaudio: PortAudio audio driver'
            'libfdk-aac: AAC audio codec'
            'opencore-amr: AMR audio codec'
            'codec2: CODEC2 low-bitrate speech codec'
            'gsm: GSM audio codec'
            'spandsp: G.722/G.726 codecs and PLC'
            'aom: AV1 video codec'
            'libvpx: VP8/VP9 video codec'
            'ffmpeg: avcodec/avformat video modules'
            'gstreamer: gst audio/video source module'
            'gst-plugins-base: gst module plugins'
            'sdl2: SDL2 video display'
            'libx11: X11 video display'
            'libpng: snapshot module'
            'libsndfile: sndfile module'
            'libsrtp: srtp media encryption module'
            'v4l-utils: v4l2 video source'
            'glib2: ctrl_dbus module'
            'mosquitto: mqtt module'
            'webrtc-audio-processing-1: WebRTC echo cancellation'
            'openbsd-netcat: forwards tel: links to a running instance')

provides=('baresip' 'baresip-qt' 'baresip-qt-gui' 'libbaresip.so')
conflicts=('baresip' 'baresip-qt' 'baresip-qt-gui')

source=("git+https://github.com/CxOrg/baresip-qt.git#branch=call-dialogue")
sha256sums=('SKIP')

pkgver() {
  cd baresip-qt
  printf "4.10.0_qt1.r%s.g%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  # No -DMODULES override: build all modules whose deps are available
  # (each module's CMakeLists auto-skips when its deps are missing).
  cmake -B build -S "${srcdir}/baresip-qt" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cmake --install build --prefix="${pkgdir}/usr"

  install -Dm644 "${srcdir}/baresip-qt/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
