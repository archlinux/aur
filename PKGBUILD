# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kate-root
_pkgbase=${pkgbase%-root}
pkgname=(kwrite-root kate-root)
pkgver=20.08.0
pkgrel=1
arch=(armv7h i686 x86_64)
license=(GPL LGPL FDL)
makedepends=(extra-cmake-modules kdoctools plasma-framework knewstuff ktexteditor threadweaver kitemmodels kactivities)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgbase-$pkgver.tar.xz"{,.sig}
        0001-Defuse-root-block.patch)
sha512sums=('223b90e9e17a4b3e41df64cb923b9d62783e49215d4e68722cfd81db0278b122aea5be61cc6fdd9ba87051992c1f3cf2fe3a74042f8d1b4b9a225e7fa93b6e41'
            'SKIP'
            '01f7fd779d2e2c87ccb78e1f6014b89687b87af33831eae74864c66ed52e18d2adbb9b2803574cd8a55f7feacd24c9b1afbf3cba5b7b45b2746a36d6072894df')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
  cd $srcdir/$_pkgbase-$pkgver
  patch -p1 -i $srcdir/0001-Defuse-root-block.patch
}

build() {
  cd build
  cmake ../$_pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package_kwrite-root() {
  pkgdesc="Text Editor, patched to be able to run as root"
  url="https://www.kde.org/applications/utilities/kwrite/"
  depends=(ktexteditor kactivities hicolor-icon-theme)
  provides=(${pkgname%-root})
  conflicts=(${provides[@]})
  replaces=(${provides[@]})

  cd build
  make DESTDIR="$pkgdir" install

  find "$pkgdir" -type f -name '*kate*' -exec rm {} \;
  rm -r "$pkgdir"/usr/lib/qt/plugins/ktexteditor \
        "$pkgdir"/usr/share/doc/HTML/*/{kate,katepart} \
        "$pkgdir"/usr/share/katexmltools \
        "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{ktexteditorpreviewplugin,lspclient,tabswitcherplugin}.mo \
        "$pkgdir"/usr/share/plasma/plasmoids
}

package_kate-root() {
  pkgdesc="Advanced Text Editor, patched to be able to run as root"
  url="https://www.kde.org/applications/utilities/kate/"
  depends=(knewstuff ktexteditor threadweaver kitemmodels kactivities hicolor-icon-theme)
  provides=(${pkgname%-root})
  conflicts=(${provides[@]})
  replaces=(${provides[@]})
  optdepends=('konsole: open a terminal in Kate')

  cd build
  make DESTDIR="$pkgdir" install

  find "$pkgdir" -type f -name '*kwrite*' -exec rm {} \;
  rm -r "$pkgdir"/usr/share/doc/HTML/*/kwrite
}
