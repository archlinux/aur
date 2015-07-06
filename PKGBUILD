# Maintainer: melchips <truphemus dot francois at gmail dot com>
# Contributor: Lari Tikkanen <lartza@wippies.com>
pkgname=bgs-git
pkgver=0.6.r2.gd455737
pkgrel=2
pkgdesc="simple background setter based on imlib2"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Gottox/bgs"
license=('MIT')
depends=('imlib2' 'libxinerama')
makedepends=('git' 'libunistring')
source=(bgs::git+https://github.com/Gottox/bgs.git)
provides=("bgs")
conflicts=("bgs")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bgs"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/bgs"
  # add the correct settings to config.mk
  sed -e "s|^\(\s*PREFIX =\).*|\1 /usr|" -i config.mk
  make
}

package() {
  cd "$srcdir/bgs"
  make DESTDIR=$pkgdir install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
