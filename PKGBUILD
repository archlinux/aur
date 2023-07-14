# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=ncparticleeditor-git
pkgver=r80.0cf203e
pkgrel=1
pkgdesc="A particle editor made with the nCine"
arch=('i686' 'x86_64')
url="http://ncine.github.io"
license=('MIT')
depends=('ncine')
makedepends=('git' 'cmake')
conflicts=('ncparticleeditor')
provides=('ncparticleeditor')
options=(!strip)
source=(
  'git+https://github.com/nCine/ncParticleEditor'
  'git+https://github.com/nCine/ncParticleEditor-data'
)
md5sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/ncParticleEditor"
  ( set -o pipefail
    git describe --tags --long --exact-match 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  mkdir -p build && cd build

  cmake ../ncParticleEditor\
        -DCMAKE_BUILD_TYPE=Release\
        -DCMAKE_PREFIX_PATH=/usr/lib/cmake/nCine\
        -DNCPROJECT_BUILD_ANDROID=OFF\
        -DNCPROJECT_STRIP_BINARIES=ON\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncParticleEditor/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
