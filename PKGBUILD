# Maintainer: Faheem Pervez < trippin1 gmail >
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: prettyvanilla <prettyvanilla at lavabit dot com>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail dot com>
# Contributor: sausageandeggs <sausageandeggs at archlinux dot us>

pkgname=dolphin-klook-frameworks
_origpkgname="${pkgname%%-*}"
_patch="$_origpkgname-15.08.1-klook.patch"
pkgver=15.12.0
pkgrel=1
pkgdesc="KDE 5 File Manager with KLook support"
arch=(i686 x86_64)
url="http://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kactivities klook-git desktop-file-utils)
makedepends=(extra-cmake-modules kdoctools python)
optdepends=('kde-cli-tools: For editing file type options' 'ffmpegthumbs: Video thumbnails' 'ruby: installing new service menus with GHNS')
conflicts=('kdebase-dolphin<15.08' kdebase-dolphin-klook "$_origpkgname")
replaces=(kdebase-dolphin)
provides=("$_origpkgname")
groups=(kde-applications kdebase)
source=("http://download.kde.org/stable/applications/$pkgver/src/$_origpkgname-$pkgver.tar.xz"
        "https://abf.rosalinux.ru/openmandriva/dolphin/raw/master/$_patch")
install="$_origpkgname.install"
md5sums=('30f452fd08914cd302b37c29143428f9'
         '37f0810bd85506f751984be3c31cdd7e')

prepare() {
  mkdir -p build
  cd "$_origpkgname-$pkgver"
  patch -Np1 -i "${srcdir}/$_patch"
}

build() {
  cd build
  cmake ../$_origpkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
