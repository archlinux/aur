# Maintainer: b.klettbach@gmail.com

pkgname=multimc5-git
pkgver=0.4.10.r14.gfc43fd1
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg')
makedepends=('git' 'patch' 'cmake' 'qt5-tools' 'qt5-x11extras' 'java-environment')
conflicts=('multimc5')
source=("$pkgname"::"git://github.com/MultiMC/MultiMC5.git"
  'multimc5.sh'
  'multimc5.desktop'
  'cmake-patch.diff')
sha512sums=('SKIP'
            'da09df830845edc052564c9ec06d33cd03b4abaf9469f651df500f8ee444ad054cbb3acf7dcaa13a4855b7cadd4c53f76d284e68787a1b7e87fd346624e08b2c'
            'a6712d0e84acc719ed1aff740717add44202f88cb42a0b7a3157108b73a1009ac7edd325f75d372e0a63617f40eb614d55fb4e24e5c1fb8957cd280486070675'
            'af4e13cedcf275ca1f95643e88162b741256309f0e6af3629762f204093946cc972a9345f838035777a1e9a64ac0f7893266a43631b9c21967c1b237264ec646')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  git apply "${srcdir}/cmake-patch.diff"
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/multimc5" \
        -DNBT_BUILD_SHARED=OFF \
        -DNBT_USE_ZLIB=ON \
        -DMultiMC_UPDATER=OFF ..
  make
}

package() {
 cd "$srcdir/$pkgname/build"
 make DESTDIR="$pkgdir" install
 install -D libMultiMC_logic.so $pkgdir/usr/lib/multimc5/bin/libMultiMC_logic.so
 install -D librainbow.so $pkgdir/usr/lib/multimc5/bin/librainbow.so
 install -D $srcdir/multimc5.sh $pkgdir/usr/bin/multimc5
 install -D $srcdir/$pkgname/application/resources/multimc/scalable/multimc.svg $pkgdir/usr/share/pixmaps/multimc5.svg
 install -D $srcdir/multimc5.desktop $pkgdir/usr/share/applications/multimc5.desktop
}
