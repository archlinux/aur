# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=diffimg-git
pkgver=r74.aeb23c2
pkgrel=1
pkgdesc='Qt based GUI to diff images'
arch=('x86_64')
url='https://github.com/sandsmark/diffimg'
license=('GPL-2.0-or-later')
depends=('qt5-base' 'qwt-qt5')
makedepends=('git' 'qt5-tools')
conflicts=(diffimg)
provides=(diffimg)
source=('git+https://github.com/sandsmark/diffimg.git'
        'fix-missing-includes.patch')
sha256sums=('SKIP'
            '7a97529d988c064bd39e2f2f7f3205e9e09ee67f82ef18138e15c826d316252c')

pkgver() {
  cd diffimg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd diffimg
  patch -Np1 -i ../fix-missing-includes.patch
  # use qwt's qmake feature, so qmake-qt5 picks the Qt5 build (qwt-qt5)
  sed -i -e '/^INCLUDEPATH += \/usr\/include\/qwt$/d' -e 's/^LIBS += -lqwt$/CONFIG += qwt/' diffimg.pro
}

build() {
  cd diffimg
  qmake-qt5
  make
}

package() {
  cd diffimg
  make INSTALL_ROOT="$pkgdir" install
  mv "$pkgdir"/usr/bin/diffimg "$pkgdir"/usr/bin/diffimg-qt
  mv "$pkgdir"/usr/share/man/man1/diffimg.1.gz "$pkgdir"/usr/share/man/man1/diffimg-qt.1.gz
  sed -i "s|/usr/bin/diffimg$|/usr/bin/diffimg-qt|" "$pkgdir"/usr/share/applications/diffimg.desktop
}
