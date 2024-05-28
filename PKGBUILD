# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-location
_basever=5.15.14
pkgver=5.15.14+kde+r7
pkgrel=1
_commit=3beb9c810611337fde61d89aa981e9f177a9ede9
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to position, satellite and area monitoring classes'
depends=('qt5-declarative')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(kde-$_pkgfqn::git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        git+https://invent.kde.org/qt/qt/qtlocation-mapboxgl.git)
sha256sums=('dc670dfa97df6934114d5e85db5ebfbbe892cd6f17e7b3ff478d9dd6e9e0d4f8'
            'SKIP')

pkgver() {
  cd kde-$_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  mkdir -p build

  cd kde-$_pkgfqn
  git submodule init
  git submodule set-url src/3rdparty/mapbox-gl-native "$srcdir"/qtlocation-mapboxgl
  git -c protocol.file.allow=always submodule update
}

build() {
  cd build

  qmake ../kde-$_pkgfqn
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
