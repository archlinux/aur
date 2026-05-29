# Maintainer: niyoko
pkgname=pipewire-visualizer-git
pkgver=197001010000.g0000000
pkgrel=1
pkgdesc='PipeWire Visualizer spectrum overlay for Wayland desktops'
arch=('x86_64')
url='https://github.com/niyoko/pipewire-visualizer'
license=('custom')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'fftw')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=('pipewire-visualizer' 'pwviz')
conflicts=('pipewire-visualizer' 'pwviz')
source=('git+https://github.com/niyoko/pipewire-visualizer.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire-visualizer

  printf '%s.g%s' \
    "$(git show -s --format=%cd --date=format:%Y%m%d%H%M HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  meson setup build pipewire-visualizer \
    --prefix=/usr \
    --buildtype=plain \
    --wrap-mode=nodownload
  meson compile -C build
}

package() {
  install -Dm755 build/pipewire-visualizer \
    "$pkgdir/usr/bin/pipewire-visualizer"
  ln -s pipewire-visualizer "$pkgdir/usr/bin/pwviz"
  install -Dm644 pipewire-visualizer/README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 pipewire-visualizer/README.md \
    "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
