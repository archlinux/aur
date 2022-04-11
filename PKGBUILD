# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

pkgname=arx-libertatis
pkgver=1.2.1
pkgrel=1
pkgdesc='Cross-platform port of Arx Fatalis, a first-person role-playing game (executables only)'
url='https://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'openal' 'libepoxy')
optdepends=('arx-fatalis-data-demo: game data from official freeware demo'
            'arx-fatalis-data-gog: game data from GOG.com installer'
            'arx-fatalis-data-copy: game data from existing Windows/Wine installation'
            'qt5-base: enable built-in crash handler (Qt5 version; recompile needed)'
            'qt4: enable built-in crash handler (Qt4 version; recompile needed)'
            'curl: enable built-in crash handler'
            'gdb: generate more detailed crash reports'
            'blender: Blender plugin to import/export Arx model files')
makedepends=('boost' 'cmake' 'glm' 'cppunit')
provides=('arx')
conflicts=('arx-git' 'arx-libertatis-git')
source=("https://arx-libertatis.org/files/arx-libertatis-$pkgver.tar.xz")
sha256sums=('aafd8831ee2d187d7647ad671a03aabd2df3b7248b0bac0b3ac36ffeb441aedf') # https://arx-libertatis.org/files/arx-libertatis-1.2.1/SHA256SUMS
install='arx-libertatis.install'

build() {
  cd $pkgname-$pkgver
  
  local _cmakeargs=(
          -DCMAKE_INSTALL_PREFIX=/usr
          -DCMAKE_INSTALL_LIBEXECDIR=lib/arx
          -DRUNTIME_DATADIR=""
          -DCMAKE_BUILD_TYPE=Release
          -DUNITY_BUILD=ON
          -DINSTALL_SCRIPTS=ON
          -DBUILD_TOOLS=ON
          -DBUILD_TESTS=ON
          -DUSE_NATIVE_FS=ON
          -DUSE_OPENAL=ON
          -DUSE_OPENGL=ON
          -DWITH_SDL=2
          -DWITH_OPENGL=epoxy
  )

  local _blender_api="$(pacman -Sddp --print-format %v blender 2>/dev/null |grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')"
  if [[ "$_blender_api" != "" ]]; then
    _cmakeargs+=(
            -DINSTALL_BLENDER_PLUGIN=ON
            -DINSTALL_BLENDER_PLUGINDIR="/usr/share/blender/${_blender_api}/scripts/addons/arx"
    )
  fi

  # -DUNITY_BUILD
  #   produces a more optimized binary, but uses a lot of RAM during
  #   compilation - disable if low on memory.
  # 
  # -DCMAKE_BUILD_TYPE=Release
  #   can be changed to CMAKE_BUILD_TYPE=Debug to get a debug build,
  #   which will run signifincantly slower but enables more runtime
  #   checks and generates better crash reports.
  
  cmake . "${_cmakeargs[@]}"
  make
}

check() {
  cd $pkgname-$pkgver
  
  make check
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
  install -Dm644 LICENSE \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.DejaVu \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE.DejaVu"
          
          
}
