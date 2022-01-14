# Contributor: Ivan Zenin <i.zenin@gmx.com>

pkgname=imlib2-heic-git
pkgver=latest
pkgrel=1
pkgdesc="HEIC/HEIF decoder for imlib2 (development version)"
arch=('x86_64')
url="https://github.com/vi/imlib2-heic"
license=('BSD')
depends=('imlib2' 'libheif')
conflicts=('imlib2-heic')
makedepends=('git')
source=("git+https://github.com/vi/imlib2-heic.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/imlib2-heic
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
  cd "${srcdir}"/imlib2-heic
  sed -i 's/imlib2-config/pkg-config imlib2/' makefile
  make
}

package()
{
  cd "${srcdir}"/imlib2-heic
  install -Dm644 -t "$pkgdir/usr/share/licenses/imlib2-heic" LICENSE
  make install DESTDIR=${pkgdir}
}
