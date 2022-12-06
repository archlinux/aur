# Maintainer: Nafis <mnabid.25@outlook.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kate-root
_pkgname=kate
pkgver=22.08.3
pkgrel=1
arch=(x86_64 i686 armv7h)
license=(GPL LGPL FDL)
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
makedepends=(extra-cmake-modules kdoctools plasma-framework)
conflicts=('kate' 'kwrite')
provides=('kate' 'kwrite')
replaces=('kwrite')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        0001-Defuse-root-block.patch)
sha256sums=('d195bc0ecf4eed66a123225686ca37c4e673d8ca30e7c39fccb02dfdc7945fa6'
            'SKIP'
            'c7d029969c6b06aa789ba0a4dbc31050974cee6bed377dbc7ee8ca1dd02e76dd')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  # root shall be allowed once again
  patch -d $_pkgname-$pkgver -Np1 < 0001-Defuse-root-block.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
