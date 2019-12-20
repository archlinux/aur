# Maintainer: Phosphenius <luca dot kredel at web dot de>
pkgname=sp9k-git
_pkgname=sp9k
pkgver=r58.b5c6db1
pkgrel=1
pkgdesc="A bullet hell/space shooter game made in C++ and SFML as a learning project."
arch=('x86_64')
url="https://github.com/Phosphenius/sp9k"
license=('MIT')
depends=('sfml>=2.5.1')
makedepends=('cmake>=3.14.0')
conflicts=(sp9k)
provides=(sp9k)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  cmake . \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSP9k_ASSET_ROOT_PATH=/usr/share/"$_pkgname" 

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
