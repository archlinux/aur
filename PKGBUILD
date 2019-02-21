pkgname=openvr-git
pkgver=1.2.10.r1.gcdc39c0
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors. Contains API and samples. The runtime is under SteamVR in Tools on Steam."
arch=('x86_64')
url="https://github.com/ValveSoftware/openvr"
license=('custom')
depends=('libgl' 'sdl2' 'glew')
optdepends=('oculus-udev: Udev rule to make the rift sensors usable to the "plugdev" group'
            'steam: For SteamVR (Duh)'
            'vive-udev: Udev rule to make the Vive sensors usable to the "plugdev" group')
makedepends=('git' 'cmake' 'qt5-base') #qt5 for the overlayexample
provides=("openvr")
options=('!strip' 'staticlibs')

source=("git+https://github.com/ValveSoftware/openvr.git"
        'https://github.com/ValveSoftware/openvr/commit/0fa21ba17748efcca1816536e27bdca70141b074.patch'
        '0001-also-add-pragma-pack-around-VRControllerState_t.patch')
md5sums=('SKIP'
         '7350517830b1a0038d30c6ad33b4bb39'
         '8a9379f8cdf9a38f21942f46378714a5')

pkgver() {
  cd "$srcdir/openvr"
  #echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/openvr"
  git apply ../0fa21ba17748efcca1816536e27bdca70141b074.patch #https://github.com/ValveSoftware/openvr/pull/594
  git apply ../0001-also-add-pragma-pack-around-VRControllerState_t.patch
}

build() {
  #export CXX=clang++
  #export CC=clang

  cd openvr
  cmake -DBUILD_SHARED=0 -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release .
  make

  # Valve's build of libopenvr_api.so contains symbols that have no source code available
  # See: https://github.com/ValveSoftware/openvr/issues/425
  #cmake -DBUILD_SHARED=1 -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release .
  #make

  cd samples
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ -Wno-dev .
  make
}

package() {
  #make install DESTDIR="$pkgdir"
  #make install DESTDIR="$pkgdir"
  install -d "$pkgdir"/usr/lib
  install -m 555 openvr/bin/linux64/libopenvr_api.so "$pkgdir/usr/lib"
  install -m 555 openvr/bin/linux64/libopenvr_api.a "$pkgdir/usr/lib"

  #make install DESTDIR="$pkgdir" #There is no installer for the samples
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/shaders"


  install -m 755 "$srcdir/openvr/samples/bin/linux64/hellovr_vulkan" "$pkgdir/usr/bin"
  for shader in "$srcdir/openvr/samples/bin/shaders/"*.spv
  do
    install -m 755 "$shader" "$pkgdir/usr/shaders"
  done

  install -m 755 "$srcdir/openvr/samples/bin/linux64/hellovr_opengl" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/openvr/samples/bin/hellovr_actions.json" "$pkgdir/usr/"
  install -m 755 "$srcdir/openvr/samples/bin/cube_texture.png" "$pkgdir/usr/" #TODO: fix source code to look in proper place
  install -m 755 "$srcdir/openvr/samples/bin/linux64/helloworldoverlay" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/openvr/samples/bin/linux64/tracked_camera_openvr_sample" "$pkgdir/usr/bin"
  
  #install -m 755 "$srcdir/build/samples/hellovr_opengl/run_hellovr.sh" "$pkgdir/usr/bin/run_hellovr.sh"
  
  install -d "$pkgdir/usr/include/"
  cp -ra "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  #install "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  
}

# vim:set ts=2 sw=2 et:
