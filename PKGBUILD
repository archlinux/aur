# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-gstfree
_pkgbase=pipewire
pkgname=(pipewire-gstfree pipewire-gstfree-docs)
pkgver=0.2.6+1+g37613b67
pkgrel=1
pkgdesc="Server and user space API to deal with multimedia pipelines"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
depends=(sbc ffmpeg rtkit)
makedepends=(git meson doxygen graphviz xmltoman valgrind)
conflicts=(pipewire)
provides=(pipewire)
_commit=37613b67ba52b5ad4e81d7ea38adc04027d9f9e5  # master
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
