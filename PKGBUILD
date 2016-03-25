# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

pkgname=arxlibertatis
pkgver=1.1.2
pkgrel=2
pkgdesc='Cross-platform port of Arx Fatalis, a first-person fantasy RPG (executables only)'
url='http://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
replaces=('arx-libertatis')
depends=('sdl' 'openal' 'glew')
optdepends=('arxfatalis-data-gog: game data from GOG.com installer'
            'arxfatalis-data-copy: game data from existing win32 installation'
            'arxfatalis-data-demo: game data from official freeware demo'
            'qt5-base: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'gdb: generate detailed crash reports')
makedepends=('boost' 'cmake')
provides=('arx')
conflicts=('arx-git')
install='arxlibertatis.install'

_archivefolder=arx-libertatis-$pkgver
source=("http://downloads.sourceforge.net/arx/$_archivefolder.tar.xz"
        "arx-libertatis-1.1.2-cmake-3.5.patch")
md5sums=('543dfdaaaaf7c337227c1b6a3087589a'
         '9f7fb2bc6878ba97d1b83781721490bf')

build() {
  cd $_archivefolder
  
  patch < "$srcdir"/arx-libertatis-1.1.2-cmake-3.5.patch
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBEXECDIR=lib/arx \
          -DCMAKE_BUILD_TYPE=Release \
          -DUNITY_BUILD=ON
  
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
  cd $_archivefolder
  
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
