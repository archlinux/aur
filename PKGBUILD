# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=ncparticleeditor-git
pkgver=r28.44e7e7a
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
source=('git://github.com/nCine/ncParticleEditor')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ncParticleEditor"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  git clone https://github.com/nCine/ncParticleEditor-data || git -C ncParticleEditor-data pull
}

build() {
  mkdir -p build && cd build

  cmake ../ncParticleEditor\
        -DCMAKE_BUILD_TYPE=Release\
        -DPACKAGE_BUILD_ANDROID=OFF\
        -DPACKAGE_STRIP_BINARIES=ON\
        -DPACKAGE_DEFAULT_DATA_DIR=/usr/share/ncparticleeditor/data\
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=$pkgdir PREFIX= install
  install -Dm0644 $srcdir/ncParticleEditor/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
