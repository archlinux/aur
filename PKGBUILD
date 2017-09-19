pkgname=pipewire-git
pkgver=0.1.5.4.gaa2a189
pkgrel=1
groups=('ps2')
pkgdesc="Multimedia processing graphs. (GIT version)"
arch=('i686' 'x86_64')
url='https://pipewire.org'
license=('LGPL')
depends=('ffmpeg'
         'libsystemd'
         )
makedepends=('graphviz'
             'doxygen'
             'xmltoman'
             )
conflicts=('pipewire')
provides=('pipewire')
source=("git+https://github.com/PipeWire/pipewire.git")
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd pipewire

  rm -fr src/gst
  for i in $(find . -type f -name '*meson*'); do sed '/gst/d' -i ${i}; done

  ./autogen.sh \
    --prefix "/usr" \
    --sysconfdir "/etc"

}

build() {
  cd pipewire
  make
}

package() {
  make -C pipewire DESTDIR="${pkgdir}" install
}
