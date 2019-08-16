pkgname=openvr-git
pkgver=.1.6.10b.r0.g52065df
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors. Contains API and samples. The runtime is under SteamVR in Tools on Steam."
arch=('x86_64')
url="https://github.com/ValveSoftware/openvr"
license=('custom')
depends=('libgl' 'sdl2' 'glew')
optdepends=('steam: SteamVR must be installed through Steam, also contains vive udev rules')
makedepends=('git' 'cmake' 'vulkan-headers' 'qt5-base') #qt5 for the overlayexample
provides=("openvr")
options=('!strip' 'staticlibs')

source=("git+https://github.com/ValveSoftware/openvr.git"
        '0001-also-add-pragma-pack-around-VRControllerState_t.patch'
        'remove-openvrpaths-check.diff'
        'https://patch-diff.githubusercontent.com/raw/ValveSoftware/openvr/pull/594.patch'
        'https://patch-diff.githubusercontent.com/raw/ValveSoftware/openvr/pull/1177.patch')
md5sums=('SKIP'
         '8a9379f8cdf9a38f21942f46378714a5'
         '904a532900792e7273702a9b45d304f2'
         '7350517830b1a0038d30c6ad33b4bb39'
         '8aaa5723852e5ee81ba910235743fde2')

pkgver() {
  cd "$srcdir/openvr"
  #echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/openvr"
  git apply ../0001-also-add-pragma-pack-around-VRControllerState_t.patch
  git apply ../remove-openvrpaths-check.diff
  git apply ../594.patch
  git apply ../1177.patch

}

build() {
  #export CXX=clang++
  #export CC=clang

  # Remove Valve's prebuilt libs so they are built from source.
  # Valve's build prebuilt libs contains internal API symbols.
  # See: https://github.com/ValveSoftware/openvr/issues/425
  rm -rf bin

  # build static libopenvr_api.a, in case want to statically link their apps
  cd openvr
  cmake -DBUILD_SHARED=0 -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release .
  make

  # libopenvr_api.so
  cmake -DBUILD_SHARED=1 -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release .
  make

  # hellovr_vulkan and hellovr_opengl
  # Example apps that are useful to test SteamVR with both graphics APIs.
  cd samples
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ -Wno-dev .
  make
}

package() {
  cd openvr
  make install DESTDIR="$pkgdir"
  install -m 555 bin/linux64/libopenvr_api.a "$pkgdir/usr/lib"

  # Install examples
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/shaders"

  cd samples

  #TODO: fix openvr upstream source to look in proper place for resources
  install -m 755 "bin/linux64/hellovr_vulkan" "$pkgdir/usr/bin"
  for shader in "bin/shaders/"*.spv
  do
    install -m 755 "$shader" "$pkgdir/usr/shaders"
  done

  install -m 755 "bin/linux64/hellovr_opengl" "$pkgdir/usr/bin"
  install -m 755 "bin/hellovr_actions.json" "$pkgdir/usr/"
  install -m 755 "bin/linux64/helloworldoverlay" "$pkgdir/usr/bin"
  install -m 755 "bin/linux64/tracked_camera_openvr_sample" "$pkgdir/usr/bin"
  install -m 755 "bin/cube_texture.png" "$pkgdir/usr/"
}

# vim:set ts=2 sw=2 et:
