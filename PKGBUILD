pkgname=openvr-git
pkgver=1.10.30.70.26fa19e
pkgrel=1
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors."
arch=('x86_64')
url="https://github.com/ValveSoftware/openvr"
license=('custom')
depends=('libgl' 'sdl2' 'glew' 'jsoncpp')
optdepends=('steam: SteamVR must be installed through Steam, also contains vive udev rules')
makedepends=('git' 'cmake' 'vulkan-headers' 'qt5-base') #qt5 for the overlayexample
provides=("openvr")
options=('!strip')

source=("git+https://github.com/ValveSoftware/openvr.git"
        '0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch'                   # openvr_capi: Add pragma pack around VRControllerState_t.
        '0002-samples-cmake-Remove-OpenVR-paths-check.patch'                                # samples/cmake: Remove OpenVR paths check.
        '0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch'                   # Use correct C++11 definition for vsprintf_s https://github.com/ValveSoftware/openvr/pull/594
        'https://patch-diff.githubusercontent.com/raw/ValveSoftware/openvr/pull/1178.patch' # Add ability to build with system installed jsoncpp
        )
md5sums=('SKIP'
         '79543abcb2f86a8dcfcc942dc32c4090'
         'd3dc9d20967362a2e92e3fb1c7f82b57'
         'e68ff412ff73b1ca75f8b17ab6c7069a'
         'bd5a473153106325233f00b3f35c46d8')

install_examples=false

pkgver() {
  cd "$srcdir/openvr"

  ver=$(git describe | sed 's/^v//')
  hash=$(git rev-parse --short HEAD)
  revision=$(git rev-list --count HEAD)

  # remove a trailing "." if needed
  if [[ ${ver:0:1} == "." ]] ; then
    ver=${ver:1:${#ver}}
  fi

  echo $ver.$revision.$hash
}


prepare() {
  cd "$srcdir/openvr"
  for i in \
    "../0001-openvr_capi-Add-pragma-pack-around-VRControllerState.patch" \
    "../0002-samples-cmake-Remove-OpenVR-paths-check.patch" \
    "../0003-samples-compat-Use-correct-definition-for-vsprintf_s.patch" \
    "../1178.patch"
  do
    echo "Applying $i"
    git apply "$i"
  done
}

build() {
  #export CXX=clang++
  #export CC=clang

  # Remove Valve's prebuilt libs so they are built from source.
  # Valve's build prebuilt libs contains internal API symbols.
  # See: https://github.com/ValveSoftware/openvr/issues/425
  rm -rf bin

  cd openvr
  # libopenvr_api.so
  cmake -DBUILD_SHARED=1 \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_SYSTEM_JSONCPP=True \
        .
  make

  # hellovr_vulkan and hellovr_opengl
  # Example apps that are useful to test SteamVR with both graphics APIs.
  if [ "$install_examples" = true ]; then
    cd samples
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ -Wno-dev .
    make
  fi
}

package() {
  cd openvr
  make install DESTDIR="$pkgdir"

  if [ "$install_examples" = true ]; then
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
  fi
}

# vim:set ts=2 sw=2 et:
