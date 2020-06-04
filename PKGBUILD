# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=openboardview
__pkgname=OpenBoardView
pkgname=${_pkgname}-git
pkgver=r646.befed74
pkgrel=1
pkgdesc="Linux SDL/ImGui edition software for viewing .brd files"
arch=('i686' 'x86_64')
url="http://openboardview.org/"
license=('MIT')
depends=('sdl2' 'fontconfig' 'sqlite' 'gtk3')
conflicts=('openboardview')
optdepends=('mdbtools: MDB file format support')
makedepends=('git' 'cmake' 'sdl2' 'zlib' 'gtk3' 'fontconfig' 'sqlite' 'libpng' 'python')
source=("${pkgname}::git+https://github.com/${__pkgname}/${__pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}"/usr/bin
  install -D -m755 utilities/bvconv.sh "${pkgdir}/usr/bin/bvconv"

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
