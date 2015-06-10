# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=qtcreator-cppcheck-plugin-git
pkgver=r22.68ab9a9
pkgrel=1
pkgdesc="QtCreator plugin using cppcheck"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://gres.biz/qtc-cppcheck/"
license=('MIT')
depends=('qtcreator' 'cppcheck')
replaces=()
provides=('qtcreator-cppcheck-plugin')
conflicts=()
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/OneMoreGres/qtc-cppcheck.git#branch=master
        'binary_default.patch')
sha256sums=('SKIP'
            'e417e53be8f58a8107008129253c20d9426f54d718ae3b07cbd64cc20ecfe9e5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # use the revision count.hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git am --signoff < ../binary_default.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake LIBS+="-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/usr" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
