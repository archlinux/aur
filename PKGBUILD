pkgname=pipewire-git
pkgver=0.2.3.17.g10ce1a02
pkgrel=1
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'v4l-utils'
         'sbc'
         )
makedepends=('graphviz'
             'doxygen'
             'xmltoman'
             'git'
             'meson'
             'valgrind'
             )
conflicts=('pipewire')
provides=('pipewire')
source=('git+https://github.com/PipeWire/pipewire.git')
sha256sums=('SKIP')
backup=('etc/pipewire/pipewire.conf')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # Reduce docs size
  printf '%s\n' >> pipewire/doc/Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes

  cd build

  arch-meson ../pipewire \
    -D docs=true \
    -D man=true \
    -D gstreamer=disabled

}

build() {
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
