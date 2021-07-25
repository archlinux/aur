# Maintainer: Matheus Fillipe <matheusfillipeag@gmail.com>

pkgname=dolvim
pkgver=21.11.70
pkgrel=1
pkgdesc='KDE File Manager patched with vi like movement keys (hjkl)'
arch=(i686 x86_64)
url=https://kde.org/applications/system/dolphin
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools packagekit-qt5 git)
optdepends=('kde-cli-tools: for editing file type options'
            'ffmpegthumbs: video thumbnails'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel'
            'purpose: share context menu'
            'packagekit-qt5: service menu installer')
groups=(kde-applications kde-system)
provides=("dolphin")
conflicts=("dolphin")
source=(git+https://invent.kde.org/system/dolphin.git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$pkgname-$pkgver"
  git apply "vi.patch"
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
