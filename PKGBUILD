pkgname=pipewire-git
pkgver=0.3.0.42.gb7dbf4bb
pkgrel=1
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'sbc'
         'vulkan-icd-loader'
         'bluez-libs'
         'jack2'
         )
makedepends=('graphviz'
             'doxygen'
             'xmltoman'
             'git'
             'meson'
             'valgrind'
             'vulkan-headers'
             )
conflicts=('pipewire')
provides=('pipewire')
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

  arch-meson ../pipewire \
    -D docs=true \
    -D gstreamer=false \
    -D ffmpeg=true \

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
