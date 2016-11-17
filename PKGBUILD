pkgname=openvr-git
pkgver=39.84e877f
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

source=("git+https://github.com/ValveSoftware/openvr.git" "countof.patch")
md5sums=('SKIP'
         'f488b62d4a88e9295adc8762cd82f551')

pkgver() {
  cd "$srcdir/openvr"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/openvr"
  # Patch for https://github.com/ValveSoftware/openvr/issues/315
  git apply -vvv "$srcdir"/countof.patch
}

build() {
  #export CXX=clang++
  #export CC=clang

  cd "$srcdir/openvr"
  cd samples
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/openvr"

  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/include/"

  cp -ra "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  install "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  install -m 555 "$srcdir/openvr/lib/linux64/libopenvr_api.so" "$pkgdir/usr/lib"
  install -m 755 "$srcdir/openvr/samples/bin/linux64/hellovr_opengl" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/openvr/samples/bin/linux64/helloworldoverlay" "$pkgdir/usr/bin"
  #install -m 755 "$srcdir/build/samples/hellovr_opengl/run_hellovr.sh" "$pkgdir/usr/bin/run_hellovr.sh"
  install -m 755 "$srcdir/openvr/samples/bin/cube_texture.png" "$pkgdir/usr/" #TODO: fix source code to look in proper place
  
}

# vim:set ts=2 sw=2 et:
