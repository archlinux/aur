#Contributor: Marco Pompili <marcs.pompili@gmail.com>
#Maintainer: Marco Pompili <marcs.pompili@gmail.com>

pkgname=polycode
pkgver=0.8.4
pkgrel=2
pkgdesc="A C++ and Lua framework for building interactive applications."
arch=('i686' 'x86_64')
url='http://polycode.org/'
license=('MIT')
depends=('lua52' 'sdl' 'glu' 'openal')
makedepends=('cmake' 'python2-ply' 'ninja' 'doxygen')
source=('http://polycode.org/download/content/Polycode-0.8.4.zip'
        'polycode.desktop')
md5sums=('e42120831f8b84a0d374d4084c462b43'
         '1e8bd5317383fb390c7cf017cfc3fb11')

prepare() {
  cd Polycode-master

  mkdir -p Dependencies/Build/Debug \
  Dependencies/Build/Release \
  Build/Debug \
  Build/Release \
  Standalone/Build
}

build() {
  cd Polycode-master

  msg2 "Building Dependencies (Debug)"
  cd Dependencies/Build/Debug
  cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug ../..
  ninja

  msg2 "Building Dependencies (Release)"
  cd ../Release
  cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release ../..
  ninja

  msg2 "Building Polycode (Debug)"
  cd ../../../Build/Debug
  cmake -G "Ninja" \
    -DPOLYCODE_BUILD_BINDINGS=ON \
    -DPOLYCODE_BUILD_PLAYER=ON \
    -DCMAKE_BUILD_TYPE=Debug \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..

  #Fixing linking for Arch
  #Also changing unnecessary stuff for polyimport and polybuild
  mv build.ninja broken.ninja
  sed 's:LINK_FLAGS = -Wl:LINK_FLAGS = -lX11 -lxcb -Wl:' <broken.ninja > build.ninja
  ninja
  ninja install

  msg2 "Building Polycode (Release)"
  cd ../Release
  cmake -G "Ninja" \
  -DPOLYCODE_BUILD_BINDINGS=ON \
  -DPOLYCODE_BUILD_PLAYER=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DPYTHON_EXECUTABLE=/usr/bin/python2 ../..

  #Fixing linking for Arch
  #Also changing unnecessary stuff for polyimport and polybuild
  mv build.ninja broken.ninja
  sed 's:LINK_FLAGS = -Wl:LINK_FLAGS = -lX11 -lxcb -Wl:' <broken.ninja > build.ninja
  ninja
  ninja install

  msg2 "Making Standalone Install"
  cd ../../Standalone/Build
  cmake -G "Ninja" ..
  ninja
  ninja install

  msg2 "Building Polycode IDE"
  cd ../../IDE/Build/Linux
  make
}

package() {
  cd Polycode-master

  install -dm755 $pkgdir/opt/$pkgname

  #cp -R Release/Linux/Framework/Bindings $pkgdir/opt/$pkgname

  msg2 "Packaging Core"
  install -dm755 $pkgdir/opt/$pkgname/Core
  cp -R Release/Linux/Framework/Core/Assets $pkgdir/opt/$pkgname/Core

  # Dependencies
  install -dm755 $pkgdir/opt/$pkgname/Core/Dependencies
  cp -R Release/Linux/Framework/Core/Dependencies/include \
  $pkgdir/opt/$pkgname/Core/Dependencies/

  install -dm755 $pkgdir/opt/$pkgname/Core/Dependencies/lib
  find Release/Linux/Framework/Core/Dependencies/lib/ \
  -maxdepth 1 -type f -exec cp {} $pkgdir/opt/$pkgname/Core/Dependencies/lib \;

  # includes libs and view
  cp -R Release/Linux/Framework/Core/include $pkgdir/opt/$pkgname/Core
  cp -R Release/Linux/Framework/Core/lib $pkgdir/opt/$pkgname/lib
  cp -R Release/Linux/Framework/Core/PolycodeView $pkgdir/opt/$pkgname/Core

  # modules
  install -dm755 $pkgdir/opt/$pkgname/Modules
  cp -R Release/Linux/Framework/Modules/include $pkgdir/opt/$pkgname/Modules/include

  install -dm755 $pkgdir/opt/$pkgname/Modules/lib
  find Release/Linux/Framework/Modules/lib/ \
  -maxdepth 1 -type f -exec cp {} $pkgdir/opt/$pkgname/Modules/lib \;

  # examples player template
  cp -R Release/Linux/Framework/Examples $pkgdir/opt/$pkgname
  cp -R Release/Linux/Framework/Player $pkgdir/opt/$pkgname
  cp -R Release/Linux/Framework/Template $pkgdir/opt/$pkgname

  #cp -R Release/Linux/Framework/Tools $pkgdir/opt/$pkgname

  msg2 "Packaging Polycode IDE"
  cp -R IDE/Build/Linux/Build $pkgdir/opt/$pkgname
  mv $pkgdir/opt/$pkgname/Build $pkgdir/opt/$pkgname/IDE

  msg2 "Packaging Utils"
  install -dm755 $pkgdir/usr/bin
  install -m755 Release/Linux/Standalone/Bin/polybuild $pkgdir/usr/bin/polybuild
  install -m755 Release/Linux/Standalone/Bin/polyimport $pkgdir/usr/bin/polyimport

  msg2 "Packaging Standalone"
  install -dm755 $pkgdir/usr/lib/$pkgname
  cp -R Release/Linux/Standalone/Player $pkgdir/usr/lib/$pkgname
  cp -R Release/Linux/Standalone/Publish $pkgdir/usr/lib/$pkgname
  cp -R Release/Linux/Standalone/Template $pkgdir/usr/lib/$pkgname

  install -dm755 $pkgdir/usr/share/applications
  install -m644 ../polycode.desktop $pkgdir/usr/share/applications/polycode.desktop

  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
