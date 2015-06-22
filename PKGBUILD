# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=qtcreator-googletest-plugin-git
pkgver=r66.00d0053
pkgrel=1
pkgdesc="QtCreator plugin using Google Test"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://gres.biz/qtc-gtest/"
license=('MIT')
depends=('qtcreator' 'gtest')
replaces=()
provides=('qtcreator-googletest-plugin')
conflicts=()
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/OneMoreGres/qtc-gtest.git#branch=master)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # use the revision count.hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake \
    "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins" \
    "QMAKE_EXTRA_COMPILERS+=lrelease" \
    "lrelease.input=TRANSLATIONS" \
    "lrelease.output=\${QMAKE_FILE_PATH}/\${QMAKE_FILE_BASE}.qm" \
    "lrelease.commands=\$\$[QT_INSTALL_BINS]/lrelease \${QMAKE_FILE_IN} -qm \${QMAKE_FILE_PATH}/\${QMAKE_FILE_BASE}.qm" \
    "lrelease.CONFIG+=no_link" \
    "PRE_TARGETDEPS+=compiler_lrelease_make_all"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/usr" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 -d "${pkgdir}/usr/share/qtcreator/translations"
  install -m644 ./translation/*.qm "${pkgdir}/usr/share/qtcreator/translations/"
}
