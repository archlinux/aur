# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

_pkgname=arx-libertatis
pkgname=$_pkgname-git
pkgver=1.2.r2714.ga7ae811
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game (executables only) (Git)'
url='https://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'zlib' 'freetype2' 'openal' 'glew' 'libepoxy')
optdepends=('qt5-tools: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'curl: enable built-in crash handler. (recompile needed)'
            'gdb: generate detailed crash reports'
            'arx-fatalis-data-demo: game data from official freeware demo'
            'arx-fatalis-data-gog: game data from gog.com installer'
            'arx-fatalis-data-copy: gamedata from existing Windows installation'
            'blender: Blender plugin to import/export Arx model files')
makedepends=('boost' 'cmake' 'git' 'glm')
checkdepends=('cppunit')
provides=('arx')
conflicts=('arx')
source=("git+https://github.com/arx/ArxLibertatis.git"
        "git+https://github.com/arx/ArxLibertatisData.git")
sha512sums=('SKIP'
            'SKIP')
install='arx-libertatis.install'

pkgver() {
  cd "$srcdir/ArxLibertatis"
  ( set -o pipefail
    git describe --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -S 'ArxLibertatis' -B 'build' \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBEXECDIR=lib/arx \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
          -DICONDIR=/usr/share/icons/hicolor/128x128/apps \
          -DRUNTIME_DATADIR='' \
          -DINSTALL_SCRIPTS=ON \
          -DSTRICT_USE=ON \
          -DUSE_NATIVE_FS=ON \
          -DUSE_OPENAL=ON \
          -DUSE_OPENGL=ON \
          -DBUILD_TESTS=OFF \
          -DWITH_SDL=2 \
          -DWITH_OPENGL=epoxy \
          -DDATA_FILES=../ArxLibertatisData
  
  # UNITY_BUILD
  #   produces a more optimized binary, but uses a lot of RAM during
  #   compilation - disable if low on memory.
  # 
  # CMAKE_BUILD_TYPE=Release
  #   can be changed to CMAKE_BUILD_TYPE=Debug to get a debug build,
  #   which will run signifincantly slower but enables more runtime
  #   checks and generates better crash reports.
  
  cmake --build 'build'
}

check() {
	cmake -S 'ArxLibertatis' -B 'build' -DBUILD_TESTS=ON
	cmake --build 'build'
	cmake --build 'build' --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  
  cd "$srcdir/ArxLibertatis"
  
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
