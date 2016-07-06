pkgname=openvr-git
pkgver=41.f05d87b
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors. Contains API and samples. The runtime is under SteamVR in Tools on Steam. Note: There's no compositor for linux, so try with hellovr -nocompositor"
arch=('x86_64')
url="https://github.com/ValveSoftware/openvr"
license=('custom')
depends=('libgl' 'sdl2' 'glew')
optdepends=("oculus-udev: Udev rule to make the rift sensors usable to the \"plugdev\" group"
            "steam: For SteamVR (Duh)"
            "vive-udev: Udev rule to make the Vive sensors usable to the \"plugdev\" group")
makedepends=('git' 'cmake' 'qt5-base') #qt5 for the overlayexample
provides=("openvr")
options=('!strip' 'staticlibs')

#TODO: use my fork with cmake until Valve implements proper linux support for the samples
source=("git+https://github.com/ChristophHaag/openvr.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/openvr"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  #export CXX=clang++
  #export CC=clang

  mkdir -p build
  #rm -rf build/*
  cd build

  #TODO: rpath will be set to build tree
  # it would be cleared by make install, but I have no install target yet. But it's not a problem, so I leave it be
  # http://www.cmake.org/Wiki/CMake_RPATH_handling#Always_full_RPATH
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release ../openvr
  make

  cd "$srcdir/openvr/samples/helloworldoverlay"
  qmake-qt5 helloworldoverlay.pro
  make
}

package() {
  cd "$srcdir/openvr"

  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/include/"

  #cp -ra "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  install "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  install -m 555 "$srcdir/openvr/lib/linux64/libopenvr_api.so" "$pkgdir/usr/lib"
  install -m 755 "$srcdir/build/samples/hellovr_opengl/hellovr" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/build/samples/hellovr_opengl/run_hellovr.sh" "$pkgdir/usr/bin/run_hellovr.sh"
  install -m 755 "$srcdir/build/samples/cube_texture.png" "$pkgdir/usr/" #TODO: fix source code to look in proper place

  install -m 755 "$srcdir/openvr/samples/bin/win32/HelloWorldOverlay" "$pkgdir/usr/bin/openvr-HelloWorldOverlay"
}

# vim:set ts=2 sw=2 et:
