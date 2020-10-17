pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-pulse-git'
         'pipewire-alsa-git'
         )
pkgver=0.3.13.99.ge1fc51d9
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
             'jack2'
             'libpulse'
             'alsa-lib'
             'ffmpeg'
             'sbc'
             'rtkit'
             'vulkan-icd-loader'
             'dbus'
             'libsndfile'
             'bluez-libs'
             'vulkan-headers'
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
  depends=('ffmpeg'
           'sbc'
           'rtkit'
           'vulkan-icd-loader'
           'bluez-libs'
           'alsa-card-profiles'
           'libdbus-1.so'
           'libsndfile.so'
           'libudev.so'
           'libasound.so'
           'libsystemd.so'
           'libglib-2.0.so'
           'libgobject-2.0.so'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-alsa-git: ALSA support'
              )
  provides=('pipewire'
            "libpipewire-${pkgver:0:3}.so"
            )
  conflicts=('pipewire')
  backup=('etc/pipewire/pipewire.conf')
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  cd "${pkgdir}"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick pulse usr/bin/pw-pulse usr/lib/pipewire-${pkgver:0:3}/pulse

  _pick jack usr/bin/pw-jack usr/lib/pipewire-${pkgver:0:3}/jack
  _pick jack usr/lib/spa-0.2/jack

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
  depends=("libpipewire-${pkgver:0:3}.so"
           'libjack.so'
           )
  provides=('pipewire-jack')
  conflicts=('pipewire-jack')

  mv jack/* "${pkgdir}"
}

package_pipewire-pulse-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (Pulse support)(GIT version)'
  depends=("libpipewire-${pkgver:0:3}.so"
           'libglib-2.0.so'
           )
  provides=('pipewire-pulse')
  conflicts=('pipewire-pulse')

  mv pulse/* "${pkgdir}"
}


package_pipewire-alsa-git() {
  pkgdesc="ALSA Configuration for PipeWire (ALSA support)(GIT version)"
  depends=("libpipewire-${pkgver:0:3}.so")
  provides=('pipewire-alsa')
  conflicts=('pipewire-alsa')
  arch=('any')

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}
