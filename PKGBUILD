# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=oreo-cursors-git
pkgver=20220821.r64.eb14e237
pkgrel=1
pkgdesc="Color material cursors with cute animations."
arch=('any')
url="https://www.pling.com/p/1360254"
license=('GPL2')
makedepends=('git' 'ruby' 'gtk-engine-murrine' 'inkscape' 'libcanberra'
             'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/varlesh/oreo-cursors.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(git show -s --format=%cd --date=format:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  make clean
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export NO_AT_BRIDGE=1

  pushd generator
  ruby convert.rb
  popd

  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
