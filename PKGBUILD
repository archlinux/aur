pkgname=pipewire-git
pkgver=0.1.9.33.g4574adcd
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
    -D enable_docs=true \
    -D enable_man=true

}

build() {
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
