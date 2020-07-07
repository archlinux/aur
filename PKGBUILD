# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

_pkgname=arx-libertatis
pkgname=$_pkgname-git
pkgver=1.21.r18839.g8ed0d4b7b
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game (executables only) (Git)'
url='https://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'zlib' 'boost-libs' 'glm' 'freetype2' 'openal' 'glew')
optdepends=('qt5-tools: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports')
makedepends=('boost' 'cmake' 'git')
provides=('arx')
conflicts=('arxlibertatis-git')
source=("git+https://github.com/arx/ArxLibertatis.git"
	"git+https://github.com/arx/ArxLibertatisData.git"
	"arx-libertatis-1.1.2-cmake-3.5.patch")
sha512sums=('SKIP'
            'SKIP'
            'c1da4981c407bc94ce87b520e2b6288fd6bac437a14dc3b54e8c2c7b01cbda0938b6995581938a2381d1f035ace95df58f3d894e8f7c6070986a5bc43f5e54c2')
install='arx-libertatis.install'

pkgver() {
  cd "$srcdir/ArxLibertatis"
  # cutting off 'ArxFatalis.' prefix that presents in the git tag
  git describe --long | sed 's/^ArxFatalis.//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/ArxLibertatis"

  patch < "$srcdir"/arx-libertatis-1.1.2-cmake-3.5.patch

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
  cd "$srcdir/ArxLibertatis"
  
  make DESTDIR="$pkgdir" install
  
  install -Dm644 README.md \
          "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG \
          "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
  install -Dm644 AUTHORS \
          "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 LICENSE \
          "$pkgdir"/usr/share/licenses/$_installname/LICENSE
  install -Dm644 LICENSE.DejaVu \
          "$pkgdir"/usr/share/licenses/$_installname/LICENSE.DejaVu
}
