# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

pkgname=arx-libertatis
pkgver=1.1.2
pkgrel=3
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game (executables only)'
url='https://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'openal' 'glew')
optdepends=('qt5-tools: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports')
makedepends=('boost' 'cmake')
provides=('arx')
conflicts=('arx-git')
source=("http://download.opensuse.org/repositories/home:/dscharrer/Debian_Testing/arx-libertatis_$pkgver.orig.tar.xz"
	"arx-libertatis-1.1.2-build.patch"
	"arx-libertatis-1.1.2-cmake-3.5.patch")
sha512sums=('d4cb8187e7f63934408e38a51a44b7da03c8628820d43139507ff97ebd463b9cd7baf6cc4e85a3d4191d6e5f56850d77d07cfffc33d8f5a51378dfb41f719fb8'
            '24e8ec75a2aeb8a1533b7513fc091223de0e91774cb0b32007829e7713230b5abf9779fb25851fe6ff18f5e6f3f157ea874426d70b940a3ac8d3f2a0188743fd'
            'c1da4981c407bc94ce87b520e2b6288fd6bac437a14dc3b54e8c2c7b01cbda0938b6995581938a2381d1f035ace95df58f3d894e8f7c6070986a5bc43f5e54c2')
install='arx-libertatis.install'

build() {
  cd $pkgname-$pkgver

  patch < "$srcdir"/arx-libertatis-1.1.2-cmake-3.5.patch
  patch < "$srcdir"/arx-libertatis-1.1.2-build.patch

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBEXECDIR=lib/arx \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_EDITOR=OFF \
          -DICONDIR=/usr/share/icons/hicolor/128x128/apps \
          -DINSTALL_SCRIPTS=ON \
          -DSTRICT_USE=ON \
          -DUSE_NATIVE_FS=ON \
          -DUSE_OPENAL=ON \
          -DUSE_OPENGL=ON \
          -DUSE_SDL=ON
  
  # UNITY_BUILD
  #   produces a more optimized binary, but uses a lot of RAM during
  #   compilation - disable if low on memory.
  # 
  # CMAKE_BUILD_TYPE=Release
  #   can be changed to CMAKE_BUILD_TYPE=Debug to get a debug build,
  #   which will run signifincantly slower but enables more runtime
  #   checks and generates better crash reports.
  
  make
}

package() {
  cd $pkgname-$pkgver
  
  make DESTDIR="$pkgdir" install
  
  install -Dm644 README.md \
          "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG \
          "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
  install -Dm644 AUTHORS \
          "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 ARX_PUBLIC_LICENSE.txt \
          "$pkgdir/usr/share/licenses/$pkgname/ARX_PUBLIC_LICENSE.txt"
}
