pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-ffmpeg-git'
         )
pkgver=0.3.19.61.gfee0c267
pkgrel=1
pkgdesc='Server and user space API to deal with multimedia pipelines. (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
makedepends=('git'
             'meson'
             'doxygen'
             'graphviz'
             'xmltoman'
             'valgrind'
             'libpulse'
             'alsa-lib'
             'jack2'
             'sbc'
             'rtkit'
             'vulkan-icd-loader'
             'dbus'
             'sdl2'
             'ncurses'
             'libsndfile'
             'bluez-libs'
             'vulkan-headers'
             'ffmpeg'
             'libldac'
             'libopenaptx'
             'libfdk-aac'
             )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd pipewire

  # Reduce docs size
  printf '%s\n' >> doc/Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes
}

build() {
  cd "${srcdir}/build"

  CFLAGS+=" -Wformat"

  arch-meson ../pipewire \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=true \
    -D gstreamer=false \
    -D ffmpeg=true \

  ninja
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="${1}" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#$pkgdir/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_pipewire-git() {
  depends=('alsa-card-profiles'
           'bluez-libs'
           'rtkit'
           'sbc'
           'vulkan-icd-loader'
           'libasound.so'
           'libdbus-1.so'
           'libfdk-aac.so'
           'libldacBT_enc.so'
           'libncursesw.so'
           'libopenaptx.so'
           'libsndfile.so'
           'libsystemd.so'
           'libudev.so'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-ffmpeg-git: ffmpeg support'
              'gst-plugin-pipewire-git: gstreamer support'
              )
  provides=('pipewire'
            "libpipewire-${pkgver:0:3}.so"
            )
  conflicts=('pipewire')
  backup=('etc/pipewire/pipewire.conf'
          'etc/pipewire/media-session.d/alsa-monitor.conf'
          'etc/pipewire/media-session.d/bluez-monitor.conf'
          'etc/pipewire/media-session.d/media-session.conf'
          'etc/pipewire/media-session.d/v4l2-monitor.conf'
          )
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  cd "${pkgdir}"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-${pkgver:0:3}/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg/libspa-ffmpeg.so

  # Use alsa-card-profiles built with Pulseaudio
  rm -rv "$pkgdir"/usr/share/alsa-card-profile

}

package_pipewire-docs-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (documentation)(GIT Version)'
  provides=('pipewire-docs')
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"
}

package_pipewire-jack-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (JACK support)(GIT Version)'
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           'libjack.so'
           )
  provides=('pipewire-jack')
  conflicts=('pipewire-jack')

  mv jack/* "${pkgdir}"
}

package_pipewire-pulse-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (Pulse support)(GIT version)'
  depends=('pipewire'
           'libpulse'
           )
  provides=('pipewire-pulse'
            'pulseaudio'
            'pulseaudio-bluetooth'
            )
  conflicts=('pipewire-pulse'
             'pulseaudio'
             'pulseaudio-bluetooth'
             )
  arch=('any')
  install=pipewire-pulse.install

  mv pulse/* "${pkgdir}"
}

package_pipewire-alsa-git() {
  pkgdesc="ALSA Configuration for PipeWire (ALSA support)(GIT version)"
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           )
  provides=('pipewire-alsa')
  conflicts=('pipewire-alsa')
  arch=('any')

  mkdir -p "$pkgdir"/etc/{alsa/conf.d,pipewire/media-session.d}
  ln -st "${pkgdir}/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
  touch "$pkgdir/etc/pipewire/media-session.d/with-alsa"
}

package_pipewire-ffmpeg-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (FFmpeg SPA plugin)(GIT version)'
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           'ffmpeg'
           )
  provides=('pipewire-ffmpeg')
  conflicts=('pipewire-ffmpeg')

  mv ffmpeg/* "${pkgdir}"
}
