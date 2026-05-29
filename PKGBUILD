# Maintainer: niyoko
pkgname=pipewire-visualizer-git
pkgver=0.r0.g0000000
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

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf '0.r%s.g%s' "$(git rev-list --count HEAD)" \
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
