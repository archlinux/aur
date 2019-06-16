# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kate-root
_pkgbase=${pkgbase%-root}
pkgname=(kwrite-root kate-root)
pkgver=19.04.2
pkgrel=1
arch=(armv7h i686 x86_64)
license=(GPL LGPL FDL)
makedepends=(extra-cmake-modules kdoctools plasma-framework knewstuff ktexteditor threadweaver kitemmodels kactivities)
source=("https://download.kde.org/stable/applications/$pkgver/src/$_pkgbase-$pkgver.tar.xz"{,.sig}
        0001-Defuse-root-block.patch)
sha512sums=('568af7df0588d65f386f482f944b44c7bacffeecf374fce4b4e276be8ca556cbf983c2df2e99a3900c15bd7dfaa0d71b6540c37b4c2773a5293b3e5cba1d3939'
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
        "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{kterustcompletion,tabswitcherplugin,ktexteditorpreviewplugin}.mo \
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
