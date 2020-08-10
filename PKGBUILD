# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=falkon
pkgname=$_pkgname-widevine-git
pkgver=3.1.0
pkgrel=1
pkgdesc="Cross-platform QtWebEngine browser"
arch=(x86_64)
url="https://www.falkon.org/"
license=(GPL3)
depends=(qt5-webengine qt5-x11extras qt5-svg)
makedepends=(extra-cmake-modules qt5-tools kio purpose libgnome-keyring pyside2 shiboken2)
optdepends=('kio: KDE integration' 'purpose: KDE integration' 'libgnome-keyring: gnome keyring integration'
            'pyside2: Python plugins')
replaces=(qupzilla)
source=("https://github.com/TheCynicalTeam/$_pkgname-widevine/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz"
        "https://github.com/TheCynicalTeam/$_pkgname-widevine/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz.sig"
        "https://github.com/TheCynicalTeam/$_pkgname-widevine/archive/$pkgver.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=(3CB7B8416EF6778B409FDC43EBC3FC294452C6D8) # David Rosca <nowrep@gmail.com>

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../$_pkgname-widevine-$pkgver/falkon-pyside-5.12.2.patch # Fix build with PySide 5.12.2
  patch -p1 -i ../$_pkgname-widevine-$pkgver/falkon-qt-5.14.patch # Fix build with Qt 5.14
  patch -p1 -i ../$_pkgname-widevine-$pkgver/falkon-qt-5.15.patch # Fix build with Qt 5.15
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
}
