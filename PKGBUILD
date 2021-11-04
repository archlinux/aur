# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eden Rose <eenov1988@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eugene Tan <jmingtan at gmail dot com>

pkgname=librocket-git
pkgver=r610.ecd648a
pkgrel=1
epoch=1
pkgdesc="HTML/CSS User Interface library"
arch=(x86_64 i686)
url="https://asarium.github.io/libRocket/wiki/documentation.html"
license=(MIT)
depends=(boost-libs freetype2 python libgl lua)
makedepends=(cmake mesa git boost)
conflicts=(librocket)
provides=(librocket)
source=("${pkgname%-git}::git+https://github.com/asarium/libRocket.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}/Build"

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
  cd "${pkgname%-git}"
  make -C Build DESTDIR="${pkgdir}" install

  # doc
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 readme.md changelog.txt "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  tail -n20 readme.md > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
