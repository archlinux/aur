# Maintainer: Maciej Suminski <orson@orson.net.pl>
# Contributor: milk
# Contributor: land_or
# based on qjackctl-svn by robertfoster

pkgname=qjackctl-git
pkgver=r1567.a4ed248
pkgrel=1
pkgdesc="A Qt front-end for the JACK low-latency audio server"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('jack' 'hicolor-icon-theme' 'portaudio')
url="https://qjackctl.sourceforge.io/"
makedepends=('cmake' 'git' 'qt5-tools')
provides=('qjackctl')
conflicts=('qjackctl' 'qjackctl-svn')
# sf.net is the original repository, but has connection problems
#source=("${pkgname}"'::git+http://git.code.sf.net/p/qjackctl/code')
source=("${pkgname}"'::git+https://github.com/rncbc/qjackctl.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONFIG_QT6=OFF \
    -S "$srcdir/${pkgname}"
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=8 sts=2 sw=2 et:
