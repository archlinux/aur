# Maintainer:
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
pkgname=tora
pkgver=3.2
pkgrel=1
pkgdesc="Toolkit for databases with support for MySQL and PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/tora-tool/tora"
license=('GPL')
depends=('qscintilla-qt5' 'boost-libs' 'loki-lib')
makedepends=('cmake' 'boost')
options=('!libtool' '!emptydirs')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tora-tool/${pkgname}/archive/v${pkgver}.tar.gz"
  missing-qbuttongroup.patch
  fix-missing-includes.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://github.com/tora-tool/tora/issues/95#issuecomment-393641305
  sed -i '/FIND_LIBRARY(QSCINTILLA_LIBRARY/s/qt5scintilla2/qscintilla2_qt5/' cmake/modules/FindQScintilla.cmake

  patch -Np1 -i "${srcdir}/missing-qbuttongroup.patch"
  patch -Np1 -i "${srcdir}/fix-missing-includes.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}

sha1sums=('2619166f023cec248044fc92ea3123031554f159'
          'eba1639b5782ce474f43890084f4bba34e72d5dd'
          '1249680803431d36a63dd2fb53d83a47c1bd03db')
