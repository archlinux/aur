# Maintainer: peterix@gmail.com

pkgname=multimc-git
pkgver=0.5.1.r143.gb8adbb9b
pkgrel=1
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
conflicts=('multimc' 'multimc5' 'multimc5-git')
replaces=('multimc5-git')
source=("$pkgname"::"git://github.com/MultiMC/MultiMC5.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir" \
        -DMultiMC_UPDATER=OFF \
        -DMultiMC_LAYOUT=lin-system \
        -DMultiMC_NOTIFICATION_URL:STRING=http://files.multimc.org/notifications.json \
        -DMultiMC_PASTE_EE_API_KEY:STRING=utLvciUouSURFzfjPxLBf5W4ISsUX4pwBDF7N1AfZ \
        ..
  make
  make test
}

package() {
 cd "$srcdir/$pkgname/build"
 make install
 install -D $srcdir/$pkgname/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc.svg
 install -D $srcdir/$pkgname/application/package/linux/multimc.desktop $pkgdir/usr/share/applications/multimc.desktop
}
