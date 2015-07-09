pkgname=oculus-rift-sdk-jherico-git
pkgver=185.cbf6f96
realver=0.5.0.1
pkgrel=2
_branch=master
pkgdesc="Oculus SDK community version. SHIM + shared release/debug (libOVRRT64_0.so.${realver}, libOVRdRT64_0.so.${realver}), OculusConfigUtil, /etc/xdg/autostart/ovrd.desktop. Use /usr/include/ovr-${realver}/ as path to the SDK."
arch=('x86_64')
url="https://github.com/jherico/OculusSDK"
license=('custom')
depends=('libgl')
optdepends=("libudev.so.0: The closed config utility is linked against libudev.so.0"
        "oculus-udev: Udev rule to make the rift sensors usable to the user \"plugdev\"")
makedepends=('git' 'cmake' 'libxrandr')
provides=("oculus-rift-sdk=${realver}")
conflicts=()
replaces=()
backup=()
options=('!strip' 'staticlibs')
install=

# Config Util is directly binaries from oculus rift sdk upstream. Look it up, if you like
source=("git+https://github.com/jherico/OculusSDK.git#branch=$_branch"
"git+https://github.com/jherico/jocular.git"
"git+https://github.com/jherico/python-ovrsdk.git"
"git+https://github.com/jherico/cmake.git"
  "http://haagch.frickel.club/files/ovr_sdk_linux_${realver}/Tools/RiftConfigUtil/Bin/Linux/x86_64/ReleaseStatic/RiftConfigUtil"
  'libovr.pc'
  'OculusTuscanyDemo.sh'
  'OculusConfigUtil.sh')

pkgver() {
  cd "$srcdir/OculusSDK"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/OculusSDK"

  git submodule init
  git config submodule.Bindings/Java.url "$srcdir/jocular"
  git config submodule.Bindings/Python.url "$srcdir/python-ovrsdk"
  git config submodule.cmake.url "$srcdir/cmake"
  git submodule update

}

build() {
#export CXX=clang++
#export CC=clang

mkdir -p build
rm -rf build/*
cd build

  msg "Building 64 bit STATIC SHIM RELEASE library"
  sed -i "s/ SHARED / STATIC /g" "$srcdir"/OculusSDK/LibOVR/CMakeLists.txt # STATIC is the default... FOR NOW!! Maybe it's needed again soon
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release -DOVR_USE_SHIM=1 -DCMAKE_CXX_FLAGS="-lX11 -lGL" ../OculusSDK
  make

  msg "Building 64 bit SHARED RELEASE library"
  sed -i "s/ STATIC / SHARED /g" "$srcdir"/OculusSDK/LibOVR/CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release -DOVR_USE_SHIM=0 -DCMAKE_CXX_FLAGS="-lX11 -lGL" ../OculusSDK
  make
  
  
  msg "Building 64 bit STATIC SHIM DEBUG library"
  sed -i "s/ SHARED / STATIC /g" "$srcdir"/OculusSDK/LibOVR/CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Debug -DOVR_USE_SHIM=1 -DCMAKE_CXX_FLAGS="-lX11 -lGL" ../OculusSDK
  make

  msg "Building 64 bit SHARED DEBUG library"
  sed -i "s/ STATIC / SHARED /g" "$srcdir"/OculusSDK/LibOVR/CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Debug -DOVR_USE_SHIM=0 -DCMAKE_CXX_FLAGS="-lX11 -lGL" ../OculusSDK
  make

}

package() {
  cd "$srcdir/OculusSDK"

  #make DESTDIR="$pkgdir/" install

  oculusv="$realver" #meh: $(cat LibOVR/Include/OVR_Version.h | sed -n 's/.*#define OVR_VERSION_STRING "\(.*\)"/\1/p')

  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/include/ovr-$oculusv/"
  install -d "$pkgdir/usr/lib/pkgconfig/"

  install "$srcdir/libovr.pc" "$pkgdir/usr/lib/pkgconfig/"
  sed -i "s/@PACKAGE_VERSION@/$oculusv/g" "$pkgdir/usr/lib/pkgconfig/libovr.pc"

  install -d "$pkgdir/usr/share/OculusConfigUtil"
  install -m 755 "$srcdir/RiftConfigUtil" "$pkgdir/usr/share/OculusConfigUtil/RiftConfigUtil"

  install "$srcdir/build/output"/libovr.a "$pkgdir/usr/lib/libOVR.a"
  install "$srcdir/build/output"/libovr.so "$pkgdir/usr/lib/libOVRRT64_0.so.5.0.1"
  ln -s libOVRRT64_0.so.5.0.1 ${pkgdir}/usr/lib/libOVRRT64_0.so.5
  install "$srcdir/build/output"/libovrd.a "$pkgdir/usr/lib/libOVRd.a"
  install "$srcdir/build/output"/libovrd.so "$pkgdir/usr/lib/libOVRdRT64_0.so.5.0.1"
  ln -s libOVRdRT64_0.so.5.0.1 ${pkgdir}/usr/lib/libOVRdRT64_0.so.5

  #library was previously named libovr
  ln -s /usr/lib/libOVRRT64_0.so.5.0.1 ${pkgdir}/usr/lib/libovr.so
  ln -s /usr/lib/libOVR.a ${pkgdir}/usr/lib/libovr.a
  ln -s /usr/lib/libOVRdRT64_0.so.5.0.1 ${pkgdir}/usr/lib/libovrd.so
  ln -s /usr/lib/libOVRd.a ${pkgdir}/usr/lib/libovrd.a

  # To be sure, these names too
  ln -s /usr/lib/libovr.so ${pkgdir}/usr/lib/libOculusVR.so
  ln -s /usr/lib/libovr.a ${pkgdir}/usr/lib/libOculusVR.a
  
  cp -ra "$srcdir/OculusSDK/LibOVR/Include"/* "$pkgdir/usr/include/ovr-$oculusv/"
  cp -ra "$srcdir/OculusSDK/LibOVRKernel/Src"/* "$pkgdir/usr/include/ovr-$oculusv/"
  
  #this is just the whole library source code. You never know.
  cp -ra "$srcdir/OculusSDK/LibOVRKernel" "$pkgdir/usr/include/ovr-$oculusv/"
  cp -ra "$srcdir/OculusSDK/LibOVR" "$pkgdir/usr/include/ovr-$oculusv/"

  #Grrr... https://github.com/Germanunkol/OgreOculusSample/blob/3ec4b9f9412db21455a324eb7d6d8dd82e2cddbf/cmake/FindOculusSDK.cmake#L36-L37
  cp -ra "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/"*.h "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Src/"
  cp -ra "$pkgdir/usr/include/ovr-$oculusv/LibOVRKernel/Src/Kernel/" "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/"
  cp -ra "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/Extras/"*.h "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/Kernel/"
  cp -ra "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/Extras/"*.h "$pkgdir/usr/include/ovr-$oculusv/LibOVR/Include/"
  
  #TODO: Bindings  

  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/OculusConfigUtil.sh" "${pkgdir}/usr/bin/OculusConfigUtil"

  install -m 755 "${srcdir}/OculusSDK/Service/OVRServer/Bin/Linux/x86_64/ReleaseStatic/ovrd" "${pkgdir}/usr/bin/"

  install -d "$pkgdir/etc/xdg/autostart"
echo "[Desktop Entry]
Type=Application
Name=Oculus Rift Service
Exec=/usr/bin/ovrd" > "$pkgdir/etc/xdg/autostart/ovrd.desktop"

}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'e650fd7a67579bbe7d41beb656424d9f'
         '76c9a7c738ce871a780cb0879148e78c'
         'e8a3510f5bea1a99b1cec5c98f314ceb'
         'cf6564fda559b6d9fa5219d7a18dd78d')
