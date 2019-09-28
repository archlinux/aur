# Maintainer: tinywrkb <tinywrkb@gmail.com>
#
# pipewire package maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-gstfree
_pkgbase=pipewire
pkgname=(pipewire-gstfree pipewire-gstfree-docs)
pkgver=0.2.7
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines. packaged without gstreamer dependencies"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
depends=(sbc ffmpeg rtkit)
makedepends=(git meson doxygen graphviz xmltoman valgrind)
conflicts=(pipewire)
provides=(pipewire)
_commit=14c11c0fe4d366bad4cfecdee97b6652ff9ed63d  # tags/0.2.7
source=("git+https://github.com/PipeWire/pipewire#commit=$_commit")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbase

  # Reduce docs size
  printf '%s\n' >>doc/Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes
}

build() {
  arch-meson $_pkgbase build \
    -D gstreamer=disabled \
    -D docs=true \
    -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_pipewire-gstfree() {
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  # Split pipewire-docs
  mkdir -p docs/share
  mv "$pkgdir/usr/share/doc" docs/share/
}

package_pipewire-gstfree-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs "$pkgdir/usr"
}
