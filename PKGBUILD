# Maintainer: Nakanomk <56832666+Nakanomk@users.noreply.github.com>

pkgname=seekey-git
pkgver=0.2.0.r20.g8c5f250
pkgrel=2
pkgdesc='Wayland keyboard visualizer with floating key bubbles (git version)'
arch=('x86_64')
url='https://github.com/Nakanomk/Seekey'
license=('MIT')
depends=(
  'cairo'
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'json-glib'
  'libevdev'
  'ncurses'
)
makedepends=(
  'gettext'
  'git'
  'pkgconf'
)
provides=('seekey')
conflicts=('seekey')
install=seekey.install
source=('seekey::git+https://github.com/Nakanomk/Seekey.git')
# VCS sources are intentionally checksummed as SKIP: their contents are
# selected by Git and pkgver(), not by a fixed archive hash.
sha256sums=('SKIP')

pkgver() {
  cd seekey

  local version
  version=$(awk -F '"' '/^#define SEEKEY_VERSION / { print $2; exit }' \
    src/seekey.h)
  printf '%s.r%s.g%s' \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  make -C seekey PREFIX=/usr
}

check() {
  make -C seekey check
}

package() {
  make -C seekey DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 seekey/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
