# Maintainer: peterix@gmail.com

pkgname=multimc-git
pkgver=0.6.12.r148.g7921f47e
pkgrel=1
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'jdk8-openjdk')
conflicts=('multimc' 'multimc5' 'multimc5-git')
provides=('multimc' 'multimc5' 'multimc5-git')
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
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMultiMC_LAYOUT=lin-system \
        -DMultiMC_NOTIFICATION_URL:STRING=https://files.multimc.org/notifications.json \
        ..
  make
}

check() {
  cd "$srcdir/$pkgname/build"
  make test
}

package() {
 cd "$srcdir/$pkgname/build"
 make install DESTDIR="$pkgdir"
 install -D $srcdir/$pkgname/launcher/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc.svg
 install -D $srcdir/$pkgname/launcher/package/linux/multimc.desktop $pkgdir/usr/share/applications/multimc.desktop
}
