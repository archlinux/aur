# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kbibtex-git
pkgver=0.8.90.r731.g7444f634
pkgrel=1
epoch=1
pkgdesc="A BibTeX editor for KDE (latest development version)"
arch=('x86_64' 'aarch64')
url='https://invent.kde.org/office/kbibtex'
license=('GPL2')
depends=(gcc-libs
         glibc
         icu
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         ki18n5
         kiconthemes5
         kitemviews5
         kio5
         kjobwidgets5
         kparts5
         kservice5
         ktexteditor5
         ktextwidgets5
         kwallet5
         kwidgetsaddons5
         kxmlgui5
         poppler-qt5
         qt5-base
         qt5-networkauth
         qt5-webengine
         qt5-xmlpatterns)
provides=('kbibtex')
conflicts=('kbibtex')
optdepends=('okular: Document preview')
makedepends=(git
             extra-cmake-modules
             kdoctools5)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/kbibtex
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

prepare() {
  cd "$srcdir"
  mkdir -p build
}

build() {
  cd "$srcdir"/build
  cmake ../kbibtex \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
