# Maintainer: Nafis <mnabid.25@outlook.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kate-root
_pkgbase=kate
pkgname=(kwrite-root kate-root)
pkgver=22.04.2
pkgrel=1
arch=(x86_64 i686 armv7h)
license=(GPL LGPL FDL)
makedepends=(extra-cmake-modules kdoctools plasma-framework knewstuff kitemmodels ktexteditor kactivities kuserfeedback)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgbase-$pkgver.tar.xz{,.sig}
        0001-Defuse-root-block.patch)
sha256sums=('7cfec8b6391d89914aa73ead3902fdafab92f73368e0e26743cd4aab1ef117de'
            'SKIP'
            '7ab717cd37161ba790a72e3871281a1268e6ce07e7900825738b5d690de96f77')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  # root shall be allowed once again
  patch -d $_pkgbase-$pkgver -Np1 < 0001-Defuse-root-block.patch
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
              'python-lsp-server: Python LSP support'
              'texlab: LaTeX LSP support'
              'rust: Rust LSP support'
              'git: git-blame plugin'
              'markdownpart: Markdown preview'
              'svgpart: SVG preview')
  provides=('kate')
  conflicts=('kate')

  DESTDIR="$pkgdir" cmake --install build

  find "$pkgdir" -type f -name '*kwrite*' -exec rm {} \;
  rm -r "$pkgdir"/usr/share/doc/HTML/*/kwrite
}
