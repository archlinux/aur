# NiceHash equihash miner. Tromp GPU/CUDAsolver build
# Maintainer: Sebastian Stammler <base64 -d<<<c2ViQGhkZG4uc3BhY2UK>
_flavour="cuda"
pkgname="nheqminer-${_flavour}-git"
pkgver=0.5c.r1.gb9900ff
pkgrel=1
pkgdesc="zcash equihash miner by NiceHash. Djezo GPU/CUDA solver build."
arch=('x86_64')
url="https://github.com/nicehash/nheqminer/"
license=('MIT')
depends=('boost' 'cuda')
makedepends=('git' 'cmake' 'gcc6')
optdepends=('zcash: zcash node and tools')
source=("${pkgname}::git+https://github.com/nicehash/nheqminer.git"
        "cuda9.patch")
md5sums=('SKIP'
         '646f9515e78ef0e364f69605ebfc7870')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git apply < ../cuda9.patch
}

_build_dir="build_${_flavour}"
build() {
  # Fix hardcoded sources path
  sed -ie 's#\.\.\/nheqminer#\.\.\/'"${pkgname}"'#g' "${pkgname}/CMakeLists.txt"
  mkdir -p ${_build_dir}
  cd ${_build_dir}
  # Since we don't use make install, skip setting RPATH in the binary
  # and use gcc-6 for compilation. Add COMPUTE=30 (or similar) right after
  # 'cmake' if you need to change nvidia compute version of your card(s)
  cmake \
    -DCMAKE_SKIP_BUILD_RPATH=true \
    -DCMAKE_C_COMPILER=/usr/bin/gcc-6 \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++-6 \
    -DCMAKE_RANLIB=/usr/bin/gcc-ranlib-6 \
    -DCMAKE_AR=/usr/bin/gcc-ar-6 \
    -DUSE_CUDA_DJEZO=true \
    -DUSE_CPU_XENONCAT=false \
    ../${pkgname}

  make -j $(nproc)
}

package() {
  install -D -m755 "${_build_dir}/nheqminer" "${pkgdir}/usr/bin/nheqminer_${_flavour}"
  install -D -m644 "${pkgname}/LICENSE_MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
