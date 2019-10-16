pkgname=pipewire-git
pkgver=0.2.7.1401.gc8ffcaae
pkgrel=1
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'sbc'
         'vulkan-icd-loader'
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
source=('git+https://github.com/PipeWire/pipewire.git'
        'git+https://github.com/PipeWire/pipewire-alsa.git'
        'git+https://github.com/PipeWire/pipewire-jack.git'
        'git+https://github.com/PipeWire/pipewire-pulseaudio.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            )
backup=('etc/pipewire/pipewire.conf')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd pipewire
  git config submodule.pipewire-alsa.url "${srcdir}/pipewire-alsa"
  git config submodule.pipewire-jack.url "${srcdir}/pipewire-jack"
  git config submodule.pipewire-pulseaudio.url "${srcdir}/pipewire-pulseaudio"
  git submodule update --init pipewire-alsa pipewire-jack pipewire-pulseaudio

  # Reduce docs size
  printf '%s\n' >> doc/Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes

  cd "${srcdir}/build"

  arch-meson ../pipewire \
    -D docs=true \
    -D gstreamer=false \
    -D ffmpeg=true \
    

}

build() {
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
