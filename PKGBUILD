# Maintainer: Nafis <mnabid.25@outlook.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kate-root
_pkgbase=kate
pkgname=(kwrite-root kate-root)
pkgver=21.04.0
pkgrel=1
arch=(x86_64 i686 armv7h)
license=(GPL LGPL FDL)
makedepends=(extra-cmake-modules kdoctools plasma-framework knewstuff kitemmodels ktexteditor kactivities kuserfeedback)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgbase-$pkgver.tar.xz{,.sig}
        0001-Defuse-root-block.patch)
sha256sums=('3780cc0de0cf078add7901e255a6524c34f093a4aff2a2d032ed88c20a7421d4'
            'SKIP'
            '2fbd6b482fcb4a56050f393ceb292e9bf72f796aeaba37ed4cadfb37c4fc90f1')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  cd $srcdir/$_pkgbase-$pkgver
  patch -Np1 -i $srcdir/0001-Defuse-root-block.patch
}

build() {
  cmake -B build -S $_pkgbase-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_kwrite-root() {
  pkgdesc='Text Editor, patched to be able to run as root'
  groups=(kde-applications kde-utilities)
  url='https://apps.kde.org/kwrite/'
  depends=(ktexteditor hicolor-icon-theme)
  provides=('kwrite')
  conflicts=('kwrite')

  DESTDIR="$pkgdir" cmake --install build

  find "$pkgdir" -type f -name '*kate*' -exec rm {} \;
  rm -r "$pkgdir"/usr/lib/qt/plugins/ktexteditor \
        "$pkgdir"/usr/share/doc/HTML/*/{kate,katepart} \
        "$pkgdir"/usr/share/katexmltools \
        "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{ktexteditorpreviewplugin,lspclient,tabswitcherplugin}.mo \
        "$pkgdir"/usr/share/plasma/plasmoids
}

package_kate-root() {
  pkgdesc='Advanced Text Editor, patched to be able to run as root'
  groups=(kde-applications kde-utilities)
  url='https://apps.kde.org/kate/'
  depends=(knewstuff ktexteditor kactivities kuserfeedback hicolor-icon-theme)
  optdepends=('konsole: open a terminal in Kate'
              'clang: C and C++ LSP support'
              'python-language-server: Python LSP support'
              'texlab: LaTeX LSP support'
              'rust: Rust LSP support')
  provides=('kate')
  conflicts=('kate')

  DESTDIR="$pkgdir" cmake --install build

  find "$pkgdir" -type f -name '*kwrite*' -exec rm {} \;
  rm -r "$pkgdir"/usr/share/doc/HTML/*/kwrite
}
