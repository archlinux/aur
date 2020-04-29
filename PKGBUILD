pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-pulse-git'
         )
pkgver=0.3.2.114.g5e99e7da
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
backup=('etc/pipewire/pipewire.conf')

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
           'libdbus-1.so'
           'libsndfile.so'
           )
  optdepends=('pipewire-docs: Documentation'
              'pipewire-jack: JACK support'
              'pipewire-pulse: PulseAudio support'
              )
  provides=('pipewire'
            "libpipewire-${pkgver:0:3}.so"
            )
  conflicts=('pipewire')
  backup=('etc/pipewire/pipewire.conf')
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  cd "${pkgdir}"

  _pick docs usr/share/doc/pipewire

  _pick pulse usr/lib/pipewire-${pkgver:0:3}/pulse

  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/lib/pipewire-${pkgver:0:3}/jack
}

package_pipewire-docs-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (documentation)(GIT Version)'
  provides=('pipewire-docs')
  conflicts=('pipewire-docs')

  mv docs/* "${pkgdir}"
}

package_pipewire-jack-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (JACK support)(GIT Version)'
  depends=("libpipewire-${pkgver:0:3}.so"
           'libjack.so'
           )
  provides=('pipewire-jack'
            'libjack-pw.so'
            )
  conflicts=('pipewire-jack')

  mv jack/* "${pkgdir}"
}

package_pipewire-pulse-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (Pulse support)(GIT version)'
  depends=("libpipewire-${pkgver:0:3}.so"
           'libpulse.so'
           'libglib-2.0.so'
           )
  provides=('pipewire-pulse'
            'libpulse-pw.so'
            'libpulse-simple-pw.so'
            'libpulse-mainloop-glib-pw.so'
            )
  conflicts=('pipewire-pulse')

  mv pulse/* "${pkgdir}"
}
