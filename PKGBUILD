# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.8
pkgrel=3
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kidletime5' 'kwin-x11' 'libcutefish' 'libpulse' 'libxcb' 'libxcursor' 'libxtst' 'polkit-qt5'
         'xf86-input-libinput' 'xf86-input-synaptics')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'xorg-server-devel')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         fix-build.patch)
sha512sums=('e796e335f6465c6e68e3c533f38209206f2043f286aadd501a17180349cf4380fda604fbb32e1a13d541c34f8926785ed6a878a7bb1fb2691d546a99e82ab3ca'
            'acd45044e9742fa12fe3c47d63ee30141788f244b5a7db4a20a969db114e0a1b0161c3f34f63cd25c1447ae10599a5266b711500fbfc61050591a13b2a287537')

prepare() {
  cd core-$pkgver
  patch -p1 -i ../fix-build.patch
}

build() {
  cmake -B build -S core-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cmake --build build/settings-daemon --target translations
  cmake --build build/notificationd --target notificationd_translations
  cmake --build build/polkit-agent --target polkit-agent-translations
  cmake --build build/shutdown-ui --target shutdown-translations
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
