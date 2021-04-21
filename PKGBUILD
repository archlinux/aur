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

pkgname=lib32-spirv-tools-git
pkgdesc='API and commands for processing SPIR-V modules. (32-bit) (git version)'
pkgver=2020.7.2021_04_20.3019.dc72924cb
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/KhronosGroup/SPIRV-Tools.git'
license=(Apache-2.0)
makedepends=('make' 'cmake' 'git' 'extra-cmake-modules' 'python' 'ninja' 'clang' 'llvm' 'llvm-libs' 'gcc' 'gcc-libs'
             'lib32-clang' 'lib32-llvm' 'lib32-llvm-libs' 'lib32-gcc-libs' 'spirv-tools')
depends=('lib32-gcc-libs' 'lib32-llvm-libs' 'spirv-tools')
provides=('lib32-spirv-tools' 'lib32-spirv-tools-git')
source=('SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git')
md5sums=('SKIP')

pkgver(){
  cd SPIRV-Tools
  echo 2020.7.$(date -I | sed 's/-/_/' | sed 's/-/_/').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
  cd SPIRV-Tools
  git clone https://github.com/KhronosGroup/SPIRV-Headers.git external/spirv-headers
  git clone https://github.com/google/effcee.git external/effcee
  git clone https://github.com/google/re2.git external/re2
  #git clone https://github.com/google/googletest.git external/googletest # optional
  #git clone https://github.com/protocolbuffers/protobuf.git external/protobuf # optional
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
export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

  cd SPIRV-Tools

  rm -rf build_32-{static,shared}

  # build shared lib

  # to enable SPIRV_BUILD_FUZZER=ON uncomment protobuf in prepare

  #cmake -H. -G Ninja -Bbuild_32-static \
  #-DCMAKE_C_FLAGS=-m32 \
  #-DCMAKE_CXX_FLAGS=-m32 \
  #-DCMAKE_INSTALL_PREFIX=/usr \
  #-DCMAKE_INSTALL_LIBDIR=lib32 \
  #-DCMAKE_BUILD_TYPE=Release \
  #-DSPIRV_WERROR=Off \
  #-DSPIRV_TOOLS_BUILD_STATIC=ON \
  #-DSPIRV_ALLOW_TIMERS=ON \
  #-DSPIRV_COLOR_TERMINAL=ON \
  #-DSPIRV_LOG_DEBUG=OFF \
  #-DSPIRV_SKIP_EXECUTABLES=OFF \
  #-DSPIRV_SKIP_TESTS=OFF \
  #-DENABLE_SPIRV_TOOLS_INSTALL=ON
  #-DSPIRV_BUILD_FUZZER=ON

  cmake -H. -G Ninja -Bbuild_32-shared \
  -DCMAKE_C_FLAGS=-m32 \
  -DCMAKE_CXX_FLAGS=-m32 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -DCMAKE_BUILD_TYPE=Release \
  -DSPIRV_WERROR=Off \
  -DSPIRV_TOOLS_BUILD_STATIC=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DSPIRV_ALLOW_TIMERS=ON \
  -DSPIRV_COLOR_TERMINAL=ON \
  -DSPIRV_LOG_DEBUG=OFF \
  -DSPIRV_SKIP_EXECUTABLES=OFF \
  -DSPIRV_SKIP_TESTS=OFF \
  -DENABLE_SPIRV_TOOLS_INSTALL=ON
  #-DSPIRV_BUILD_FUZZER=ON

  #ninja -C build_32-static
  ninja -C build_32-shared
}

package_lib32-spirv-tools-git(){
  #DESTDIR="$pkgdir" ninja -C SPIRV-Tools/build_32-static/ install
  DESTDIR="$pkgdir" ninja -C SPIRV-Tools/build_32-shared/ install

  rm -rf "${pkgdir}"/usr/{bin,include,share}

  # install licence
  install -Dm644 "${srcdir}"/SPIRV-Tools/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "${pkgdir}/usr/bin"
  for i in $(find . -type f); do mv ${i} ${i}-32; done
  mv spirv-lesspipe.sh-32 spirv-lesspipe-32.sh
  sed 's|spirv-dis|spirv-dis-32|g' -i spirv-lesspipe-32.sh
}
