# Maintainer: João Figueiredo <islandc0der@chaotic.cx> (29/05/2020)
# Contributor: Xwang (Fixed a compiling issue, 30/05/2020)
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefano Zamprogno <stefano dot zamprogno at gmail dot com>

pkgname=knemo
pkgver=1.7.7.1_git20191016
pkgrel=2
pkgdesc="The KDE Network Monitor"
arch=($CARCH)
url="https://www.linux-apps.com/content/show.php?content=12956"
license=(GPL)
depends=(kdelibs4support libksysguard knotifyconfig wireless_tools iw plasma-framework hicolor-icon-theme)
makedepends=(git extra-cmake-modules kcmutils plasma-framework kdoctools kdesignerplugin kinit)
source=("git+https://github.com/KDE/$pkgname.git#commit=5ffe42353bbdd52ffdf9fd505c32ba81fdf2de91" switch_rx-tx.patch)
sha256sums=('SKIP'
            '00b8b795490fb6cef5e07cb241264f9903eeba2ff6000fc90d74395e907e34e9')

prepare() {
  cd $pkgname
  git merge --no-edit origin/topic-llvm+freebsd_ipv6 origin/frameworks
  patch -p1 < ../switch_rx-tx.patch
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
