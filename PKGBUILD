# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
epoch=3
pkgver="2023.5".3845.2a238ed24
pkgrel=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('custom')
groups=('vulkan-devel')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools'
              'git+https://github.com/google/googletest.git'
              'git+https://github.com/google/effcee.git'
              'git+https://github.com/google/re2.git'
              'git+https://github.com/abseil/abseil-cpp.git'
)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
depends=(glibc gcc-libs sh)
makedepends=(cmake python git spirv-headers-git)
conflicts=(spirv-tools)
provides=(spirv-tools)


cmake_args=(
  -G "Unix Makefiles"
  -D CMAKE_BUILD_TYPE=Release
  -D CMAKE_INSTALL_PREFIX=/usr
  -D CMAKE_INSTALL_LIBDIR=lib
  -D SPIRV-Headers_SOURCE_DIR=/usr/
  -D BUILD_SHARED_LIBS=ON
  -D SPIRV_TOOLS_BUILD_STATIC=OFF
  -D SPIRV_WERROR=OFF
)




prepare() {
  # link external sources so cmake can find them
  pushd SPIRV-Tools/external
  ln -s "$srcdir"/googletest
  ln -s $srcdir/abseil-cpp abseil_cpp
  ln -s "$srcdir"/effcee
  ln -s "$srcdir"/re2
  popd
  
#  patch --directory="SPIRV-Tools" --forward --strip=1 --input="${srcdir}"/212dd9247ad60d5dcd262e43c24ec92de1a8ef1d.patch
#  patch --directory="SPIRV-Tools" --forward --strip=1 --input="${srcdir}"/5cf47a9f90e192a1c799a04d7416b6dcd7dd59a8.patch
  
  cmake   -S SPIRV-Tools -B _build "${cmake_args[@]}" -Wno-dev
  make -C _build spirv-tools-build-version
}

pkgver() {
  local _ver1 _ver2
  # read fails if only 1 var is used
  IFS="," read -r _ver1 _ver2 < _build/build-version.inc || [ -n "_ver1" ]
  
  cd SPIRV-Tools  
  echo ${_ver1//v/}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}



build() {
  make -C _build
}

check() {
    make -C _build test
}

package() {
  
  make -C _build DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
