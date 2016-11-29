# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=stderred-git
_gitname=stderred
pkgver=v1.0.r30.gab40b5f
pkgrel=4
pkgdesc="LD_PRELOAD hack to color stderr output red"
arch=(i686 x86_64)
url="https://github.com/sickill/stderred"
license=(MIT)
source=(git+https://github.com/sickill/stderred)
depends=(glibc)
provides=(stderred)
conflicts=(stderred)
makedepends=(git cmake)
md5sums=(SKIP)
optdepends=('bash: to use the convenience script')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  [ -d build ] || mkdir build
  pushd build
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib ../src
  make
  popd
}

package() {

  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/$_gitname"/README.md "$pkgdir"/usr/share/doc/stderred/README.md
  install -D "$srcdir/$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/stderred-git/LICENSE
  install -D "$srcdir/$_gitname"/usr/bin/stderred "$pkgdir"/usr/bin/stderred
  install -D "$srcdir/$_gitname"/usr/share/stderred/stderred.sh "$pkgdir"/usr/share/stderred/stderred.sh
}
