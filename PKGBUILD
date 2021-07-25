# Maintainer: Matheus Fillipe <matheusfillipeag@gmail.com>

pkgname=dolvim
pkgrealname=dolphin
pkgver=21.07.80.r14.g6e56cc328
pkgrel=1
pkgdesc='KDE File Manager patched with vi like movement keys (hjkl)'
arch=(i686 x86_64)
url=https://kde.org/applications/system/dolphin
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit kactivities kuserfeedback)
makedepends=(git extra-cmake-modules kdoctools packagekit-qt5 git)
optdepends=('kde-cli-tools: for editing file type options'
            'ffmpegthumbs: video thumbnails'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel'
            'purpose: share context menu'
            'packagekit-qt5: service menu installer')
groups=(kde-applications kde-system)
provides=("${pkgrealname}")
conflicts=("${pkgrealname}")
source=(git+https://invent.kde.org/system/dolphin.git vi.patch)
md5sums=('SKIP'
         '0335a201c64e45f0e3bc054e1ca7f8b4')

pkgver() {
    git -C "${pkgrealname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$srcdir/${pkgrealname}"
  git apply "../vi.patch"
}

build() {
    cmake -B build -S "${pkgrealname}" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
