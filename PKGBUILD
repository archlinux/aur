# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=oreo-cursors-git
pkgver=20250419.r68.7483f2d
pkgrel=2
pkgdesc="Color material cursors with cute animations."
arch=('any')
url="https://github.com/varlesh/oreo-cursors"
license=('GPL-2.0-or-later')
makedepends=(
  'git'
  'inkscape'
  'libcanberra'
  'ruby'
  'xorg-xcursorgen'
  'xorg-server-xvfb'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/varlesh/oreo-cursors.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  make clean
}

build() {
  cd "${pkgname%-git}"
  export NO_AT_BRIDGE=1
  ruby generator/convert.rb
  xvfb-run make build
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
