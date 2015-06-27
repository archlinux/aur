# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=lib32-vogl-git
pkgver=418.b3a52c2
pkgrel=1
pkgdesc="An OpenGL debugger"
arch=('x86_64')
url="https://github.com/ValveSoftware/vogl"
license=('MIT')
# if building the glxspheres64 demo, add following dependencies:
#     'glu' 'freeglut' 'libxxf86vm' 'sdl2'
depends=('lib32-qt5-base' 'lib32-libjpeg-turbo' 'lib32-tinyxml' 'lib32-libunwind' 'lib32-sdl2')
makedepends=('git' 'cmake' 'gcc-multilib')
optdepends=('steam: trace games from Steam')
#options=('!buildflags' '!makeflags')
install=vogl.install
source=('git+https://github.com/ValveSoftware/vogl.git' 'vogl.sh')
md5sums=('SKIP'
         'c9e00b04f42f293c10cfe3622911d345')

pkgver() {
  cd "$srcdir/vogl"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/vogl"
  # disable building of glxspheres64 demo to keep the dependencies minimal
  sed -i 's|add_subdirectory.*glxspheres.*|#&|' CMakeLists.txt
  # disable tests
  sed -i 's|add_subdirectory.*vogltest.*|#&|' CMakeLists.txt
}

build() {
  mkdir -p "$srcdir/build"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS="-m32"

  # build vogl
  cd "$srcdir/build"
  cmake ../vogl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=True \
    -DCMAKE_PREFIX_PATH="/usr/lib32" \
    -DBUILD_X64=Off
  make
}

package() {
  cd "$srcdir/vogl"

  install -d -m755 "$pkgdir/opt/"
  cp -a vogl_build "$pkgdir/opt/vogl"

  install -D -m755 "$srcdir/vogl.sh" "$pkgdir/etc/profile.d/vogl32.sh"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
