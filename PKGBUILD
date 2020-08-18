# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio-append-slash
_pkgname=kio
pkgver=5.73.0
pkgrel=1
pkgdesc='Resource and network access abstraction; append slash during URI completion again'
# https://invent.kde.org/frameworks/kio/-/commit/9f5f8540112e1178aa54a350f29b542c5de7df68
# https://bugs.kde.org/show_bug.cgi?id=420966
conflicts=('kio')
provides=('kio')
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(solid kjobwidgets kbookmarks libxslt kwallet ktextwidgets kded)
makedepends=(extra-cmake-modules kdoctools doxygen qt5-tools qt5-doc)
optdepends=('kio-extras: extra protocols support (sftp, fish and more)' 'kdoctools: for the help kioslave'
            'knetattach: to add new kio-remote entries' 'kio-fuse: to mount remote filesystems via FUSE')
groups=(kf5)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('05da159e6cf5ef9aa4dd7ede86ce28a5581624a1b3f0b4718c5b7e30c4aa2a66'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  sed -i 's/"popupAppendSlash", false/"popupAppendSlash", true/g' $_pkgname-$pkgver/src/widgets/kurlcompletion.cpp
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
