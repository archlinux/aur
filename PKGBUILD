#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Daniel Bermond <dbermond@archlinux.org>
#Credits: Bruno Pagani <archange@archlinux.org>

#######################################

#Set compiler to build spirv package
#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=spirv-llvm-translator-rc
pkgdesc='Tool and a library for bi-directional translation between SPIR-V and LLVM IR (rc release)'
url='https://github.com/KhronosGroup/SPIRV-LLVM-Translator/'
pkgver=12.0.0rc5
pkgrel=1
arch=('x86_64')
license=(custom)
depends=('llvm-libs')
makedepends=('cmake' 'llvm' 'spirv-tools' 'python' 'python-setuptools' 'clang' 'make' 'ninja' 'gcc' 'gcc-libs')
conflicts=('spirv-llvm-translator' 'spirv-llvm-translator-git' 'spirv-llvm-translator-stable')
provides=('spirv-llvm-translator')
source=('https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/llvm_release_120.zip')
md5sums=('SKIP')

build(){
if [[ $_compiler = "1" ]]; then
  export CC="gcc -m64"
  export CXX="g++ -m64"
elif [[ $_compiler = "2" ]]; then
  export CC="clang -m64"
  export CXX="clang++ -m64"
else
  export CC="gcc -m64"
  export CXX="g++ -m64"
fi

  cd SPIRV-LLVM-Translator-llvm_release_120

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_SKIP_RPATH=ON \
  -DLLVM_INCLUDE_TESTS=ON \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit

  ninja -C build
  ninja -C build llvm-spirv
}

package(){

    DESTDIR="${pkgdir}" ninja -C SPIRV-LLVM-Translator-llvm_release_120/build/ install

    install -Dm755 SPIRV-LLVM-Translator-llvm_release_120/build/tools/llvm-spirv/llvm-spirv -t "${pkgdir}"/usr/bin

    install -Dm644 SPIRV-LLVM-Translator-llvm_release_120/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
