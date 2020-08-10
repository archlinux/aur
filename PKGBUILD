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
replaces=('qupzilla' 'qupzilla-qt5' 'qupzilla-qt5-git' 'falkon' 'falkon-git')
source=("https://github.com/TheCynicalTeam/$_pkgname-widevine/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz"
        "https://github.com/TheCynicalTeam/$_pkgname-widevine/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz.sig"
        "https://github.com/TheCynicalTeam/$_pkgname-widevine/archive/$pkgver.tar.gz")
sha256sums=('ce743cd80c0e2d525a784e29c9b487f73480119b0567f9ce8ef1f44cca527587'
            '7244087a0822953f05be8530f0b760a5e358f2dbdc8b6a36efd18c9a49139173'
            '82331187f473032fd17007209e74d03d308f5152457d2e209b67dccd01cc8469')
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
  install -Dm644 $_pkgname-widevine-$pkgver/libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
}
