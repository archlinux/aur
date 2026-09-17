# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=openboardview
__pkgname=OpenBoardView
pkgname=${_pkgname}-git
pkgver=10.0.0.r6.gcc76e69
pkgrel=1
pkgdesc="Linux SDL/ImGui edition software for viewing .brd files"
arch=('i686' 'x86_64')
url="http://openboardview.org/"
license=('MIT')
depends=('zlib' 'sdl2' 'fontconfig' 'sqlite' 'gtk3')
conflicts=('openboardview')
optdepends=('mdbtools: for bvconv tool to convert BV files to BVR')
makedepends=('git' 'cmake' 'python' 'python-jinja')
source=("${pkgname}::git+https://github.com/${__pkgname}/${__pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  cmake \
    -S . \
    -B build/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  provides=($_pkgname=$pkgver)
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}"/usr/bin
  install -D -m755 utilities/bvconv.sh "${pkgdir}/usr/bin/bvconv"

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  DESTDIR="${pkgdir}" cmake --install build/
}

# vim:set ts=2 sw=2 et:
