# Maintainer:  Eden Rose <eenov1988@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eugene Tan <jmingtan at gmail dot com>

_pkgname="librocket"
pkgname="$_pkgname-asarium-git"
pkgver=1.2.2
pkgrel=1
pkgdesc="The HTML/CSS User Interface library, maintained fork"
arch=('i686' 'x86_64')
url="https://asarium.github.io/libRocket/wiki/documentation.html"
license=('MIT')
depends=('boost-libs' 'freetype2' 'python' 'libgl' 'lua')
makedepends=('cmake' 'mesa' 'git' 'boost')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname" "$_pkgname-git")
source=("$pkgname::git+https://github.com/asarium/libRocket.git"
'lua-port.patch' 'python3.patch' 'glew-link.patch' 'lua-sample-build.patch')
sha256sums=('SKIP'
    'SKIP' 'SKIP' 'SKIP' 'SKIP') # Skip patches tracked by git

prepare() {
    cd "$pkgname"

    echo " == patch: Fixes build with lua newer than 5.1 =="
    patch -Np0 < ../lua-port.patch

    echo " == patch: Fixes build with python 3 =="
    patch -Np0 < ../python3.patch

    echo " == patch: Fixes wrong name used for GLEW library when linking samples =="
    patch -Np0 < ../glew-link.patch

    echo " == patch: Fix building of lua sample =="
    patch -Np0 < ../lua-sample-build.patch
}

build() {
  cd "$pkgname/Build"

  # Skip samples, they won't install nicely
  #  -DSAMPLES_DIR="/usr/share/doc/$_pkgname/"

  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_PYTHON_BINDINGS=True \
    -DBUILD_LUA_BINDINGS=True \
    -DBUILD_SAMPLES=False \
    .
  make
}

package() {
  cd "$pkgname"
  make -C Build DESTDIR="$pkgdir" install

  # doc
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 readme.md changelog.txt "$pkgdir/usr/share/doc/$_pkgname"
  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  tail -n20 readme.md > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
