# Maintainer: zotan <aur@zotan.email>
# Contributor: peterix@gmail.com

pkgname=multimc-lhaus-git
pkgver=0.6.11.r123.g1642383d
pkgrel=1
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'jdk8-openjdk')
conflicts=('multimc' 'multimc5' 'multimc5-git' 'multimc-git')
provides=('multimc' 'multimc5' 'multimc5-git' 'multimc-git')
source=("$pkgname"::"git://github.com/lhaus/MultiMC.git")
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
 install -D $srcdir/$pkgname/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc.svg
 install -D $srcdir/$pkgname/application/package/linux/multimc.desktop $pkgdir/usr/share/applications/multimc.desktop
}
