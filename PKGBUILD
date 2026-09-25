# Maintainer: Nakanomk <56832666+Nakanomk@users.noreply.github.com>

pkgname=seekey-git
pkgver=0.3.0.r38.g625c459
pkgrel=1
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
  'pango'
)
makedepends=(
  'gettext'
  'git'
  'pkgconf'
)
optdepends=(
  'fuzzel: native settings menu for --config-gui (a built-in GTK menu is used without it)'
)
provides=('seekey')
conflicts=('seekey')
install=seekey.install
source=(
  'seekey::git+https://github.com/Nakanomk/Seekey.git'
  '70-seekey-input.rules'
)
# VCS sources are intentionally checksummed as SKIP: their contents are
# selected by Git and pkgver(), not by a fixed archive hash.
sha256sums=(
  'SKIP'
  'b570a8b92fc07b934e8aff5bf723a7e07e4494ab01c11ce87fa7b67c3f5ec4d1'
)

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
  install -Dm644 70-seekey-input.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-seekey-input.rules"
}
