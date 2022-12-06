# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=kmplayer
pkgver=0.12.0.b
_pkgver=0.12.0b
pkgrel=4
pkgdesc="Video player plugin for Konqueror and basic MPlayer/Xine/ffmpeg/ffserver/VDR frontend for KDE"
arch=(x86_64)
license=(GPL LGPL FDL)
url="https://kmplayer.kde.org"
depends=(kmediaplayer kdelibs4support phonon-qt5 hicolor-icon-theme)
makedepends=(extra-cmake-modules kdesignerplugin kdoctools kinit)
optdepends=('mplayer: mplayer backend')
source=("https://download.kde.org/stable/$pkgname/${_pkgver%.*}/$pkgname-$_pkgver.tar.bz2"
        kmplayer-desktop.patch::"https://invent.kde.org/multimedia/kmplayer/-/commit/2126d76b.patch"
        kmplayer-qt5.9.patch::"https://invent.kde.org/multimedia/kmplayer/-/commit/3def6507.patch"
        kmplayer-qt5.11.patch::"https://invent.kde.org/multimedia/kmplayer/-/commit/7dafda63.patch")
sha256sums=('5e98cea9bd958860d90003d37037172a95ed8b699133e8f1e6033147aaefed73'
            'f584a485096d7eea7a4374b5c5591bd64b52424fddd883a81bc00f7bb2b11d92'
            '2e4aa293fd6fe3d4184028a767590247ec3be1210e292a9e87cd4447274ca090'
            '2ecdc0d1025b46f77fbff80b37c817d0873a476903b2e18b32a78e1aec387b28')

prepare() {
  sed -e 's/org.kde.//g' -i kmplayer-desktop.patch
  patch -d $pkgname-$_pkgver -p1 < kmplayer-desktop.patch # Fix launching from desktop file
  patch -d $pkgname-$_pkgver -p1 < kmplayer-qt5.9.patch # Fix build with Qt 5.9
  patch -d $pkgname-$_pkgver -p1 < kmplayer-qt5.11.patch # Fix build with Qt 5.11
}

build() {
  cmake -B build -S $pkgname-$_pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
