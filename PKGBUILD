#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Laurent Carlier <lordheavym@gmail.com>

#######################################

#Set compiler to build spirv package
#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=vulkan-tools-git
pkgdesc='Vulkan Utilities and Tools (git version)'
pkgver=1.2.176.2021_04_20.7213.eb3d67bd
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Tools'
license=('custom')
makedepends=('git' 'cmake' 'python' 'vulkan-headers' 'libx11' 'wayland' 'glslang' 'spirv-tools' 'make' 'extra-cmake-modules'
             'clang' 'llvm' 'llvm-libs' 'gcc' 'gcc-libs' 'ninja')
depends=('gcc-libs' 'llvm-libs' 'libxcb' 'vulkan-icd-loader')
conflicts=('vulkan-tools')
provides=('vulkan-tools' 'vulkan-tools-git')
source=('Vulkan-Tools::git+https://github.com/KhronosGroup/Vulkan-Tools.git')
md5sums=('SKIP')

pkgver(){
 cd Vulkan-Tools
 echo 1.2.176.$(date -I | sed 's/-/_/' | sed 's/-/_/').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
if [[ $_compiler = "1" ]]; then
  export CC="gcc"
  export CXX="g++"
elif [[ $_compiler = "2" ]]; then
  export CC="clang"
  export CXX="clang++"
else
  export CC="gcc"
  export CXX="g++"
fi

  cd Vulkan-Tools

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/usr/share \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_WSI_XCB_SUPPORT=On \
  -DBUILD_WSI_XLIB_SUPPORT=On \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DBUILD_CUBE=ON \
  -DBUILD_VULKANINFO=ON \
  -DBUILD_ICD=OFF \
  -DGLSLANG_INSTALL_DIR=/usr \
  -DCMAKE_BUILD_TYPE=Release

  ninja -C build/
}

package(){
  DESTDIR="$pkgdir" ninja -C Vulkan-Tools/build/ install

  # install licence
  install -Dm644 "${srcdir}"/Vulkan-Tools/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
