# Maintainer: peterix@gmail.com

pkgname=multimc5-git
pkgver=0.5.1.r85.ga379d43d
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
conflicts=('multimc5')
source=("$pkgname"::"git://github.com/MultiMC/MultiMC5.git"
  'multimc5.sh'
  'multimc5.desktop')
sha512sums=('SKIP'
            '9ed2a29eec6468d00129ef64f9b7bfc799850854143835b2b5b7631404985dc3737cac5ecdf85796a79cbce5422558e7cb390fc86dc53da30cfe311cc04d663c'
            '55c0daa45f849831e74c2d5a6d4a3dba6d6d8018bf226beadc4726b749320728502068f49741026e487c2bcf9826c1a4f54f110d2a20e9e0a0deb5cf2d616b92')

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
        -DCMAKE_INSTALL_PREFIX="/usr/lib/multimc5" \
        -DMultiMC_UPDATER=OFF \
        -DMultiMC_LAYOUT=lin-nodeps \
        -DMultiMC_NOTIFICATION_URL:STRING=http://files.multimc.org/notifications.json \
        -DMultiMC_PASTE_EE_API_KEY:STRING=c548e342e0bd312f627930fb6e3be37c \
        ..
  make
  make test
}

package() {
 cd "$srcdir/$pkgname/build"
 make DESTDIR="$pkgdir" install
 install -D $srcdir/multimc5.sh $pkgdir/usr/bin/multimc5
 install -D $srcdir/$pkgname/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc5.svg
 install -D $srcdir/multimc5.desktop $pkgdir/usr/share/applications/multimc5.desktop
}
