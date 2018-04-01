# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=vogl-git
pkgver=716.434dcc5
pkgrel=1
pkgdesc="An OpenGL debugger"
arch=('i686' 'x86_64')
url="https://github.com/ValveSoftware/vogl"
license=('MIT')
# if building the glxspheres64 demo, add following dependencies:
#     'glu' 'freeglut' 'libxxf86vm' 'sdl2'
depends=('qt5-base' 'libjpeg-turbo' 'tinyxml' 'libunwind' 'sdl2')
makedepends=('git' 'cmake')
optdepends=('steam: trace games from Steam')
install=vogl.install
source=('git+https://github.com/ValveSoftware/vogl.git'
        'fix_qt5.9_conflicts.patch::https://github.com/ValveSoftware/vogl/commit/be3d85f9324db44058fddb973b776e2475c355df.patch'
        'vogl.sh')
md5sums=('SKIP'
         'c873293300bbfec229cdecd78948c4a7'
         'c9e00b04f42f293c10cfe3622911d345')

[[ $CARCH == 'x86_64' ]] && _EXTRAFLAGS="-DBUILD_X64=On" || _EXTRAFLAGS="-DBUILD_X64=Off"

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

  # workaround upstream bug #222
  patch -Np1 < "$srcdir/fix_qt5.9_conflicts.patch"
}

build() {
  mkdir -p "$srcdir/build"

  # build vogl
  cd "$srcdir/build"
  cmake ../vogl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=True \
    $_EXTRAFLAGS
  make
}

package() {
  cd "$srcdir/vogl"

  install -d -m755 "$pkgdir/opt/"
  cp -a vogl_build "$pkgdir/opt/vogl"

  install -D -m755 "$srcdir/vogl.sh" "$pkgdir/etc/profile.d/vogl.sh"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
