# Maintainer: Dynakarp <dynacorp@protonmail.com>

_pkgname=kcoreaddons
pkgname=kcoreaddons-blucrystal
pkgver=5.75.0
pkgrel=1
pkgdesc='Addons to QtCore (with the metric binary dialect, so sizes will be measured in KB/MB/GB/etc instead of KiB/MiB/GiB/etc)'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules qt5-tools qt5-doc qt5-doc clang python-pyqt5 doxygen sip)
optdepends=('python-pyqt5: for the Python bindings')
groups=(kf5)
provides=(kcoreaddons)
conflicts=(kcoreaddons)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"{,.sig}
        "prefix.patch")
sha256sums=('9ca2cf82ddc12e27ff73aaefdf616c3eb6552a3a5531f014b5bf52a34a4c73f9'
            'SKIP'
            '85315f2bea9e2bf31ebe6c8edb57731672cf8471713b7d7757d4a4d115b6d92f')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  cd $_pkgname-$pkgver
  
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -D_KDE4_DEFAULT_HOME_POSTFIX=4 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
