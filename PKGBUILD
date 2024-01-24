# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=kfilemetadata
pkgname=${_name}5
pkgver=5.114.0
pkgrel=2
pkgdesc='A library for extracting file metadata'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(ki18n5 karchive5 kconfig5 kcoreaddons5 exiv2 poppler-qt5 taglib ffmpeg ebook-tools)
optdepends=('catdoc: Extract text from Office 98 files'
            'kdegraphics-mobipocket: MOBI extractor'
            'libappimage: AppImage extractor')
makedepends=(extra-cmake-modules catdoc doxygen qt5-tools qt5-doc libappimage kdegraphics-mobipocket)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kfilemetadata/-/commit/c9a90eed.patch
        taglib-2.patch)
sha256sums=('c094808ca31f0c7ee0f78ed154aa2761850b51385d052e408c3d6b0a59126a97'
            'SKIP'
            '392855a8c9dd464363f5bdc522dbc472c7767bc402e9f48e1b51587807d1a8df'
            'd6ccf31e4aaf197a16f3860924d82ae24328997cd0d5366a4fb2d3f1de2b422a')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
# Fix build with taglib 2
  patch -d $_name-$pkgver -p1 < c9a90eed.patch
  patch -d $_name-$pkgver -p1 < taglib-2.patch
}

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
