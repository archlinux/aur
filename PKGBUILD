# NiceHash equihash miner. Tromp GPU/CUDAsolver build
# Maintainer: Sebastian Stammler <echo c2ViQGhkZG4uc3BhY2UK|base64 -d>
_pkgname=nheqminer-cuda
pkgname=${_pkgname}-git
pkgver=0.4b.r0.geb37570
pkgrel=1
pkgdesc="zcash equihash miner by NiceHash. Tromp GPU/CUDA solver build."
arch=('x86_64')
url="https://github.com/nicehash/nheqminer/"
license=('MIT')
depends=('boost' 'cuda')
makedepends=('git' 'cmake')
optdepends=('zcash: zcash node and tools')
source=("${pkgname}::git+https://github.com/nicehash/nheqminer.git#branch=Linux")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_binary="nheqminer_cuda_tromp"
_build_dir="Linux_cmake/${_binary}"
build() {
  cd "${pkgname}/${_build_dir}"
  # Since we don't use make install, skip setting RPATH in the binary
  # and use gcc-5 for compilation. Add COMPUTE=30 (or similar) right after
  # 'cmake' if you need to change nvidia compute version of your card(s)
  cmake \
    -DCMAKE_SKIP_BUILD_RPATH=true \
    -DCMAKE_C_COMPILER=/usr/bin/gcc-5 \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++-5 \
    -DCMAKE_RANLIB=/usr/bin/gcc-ranlib-5 \
    -DCMAKE_AR=/usr/bin/gcc-ar-5 \
    .
  make -j $(nproc)
}

package() {
  cd "${pkgname}"
  install -D -m755 "${_build_dir}/${_binary}" -t "${pkgdir}/usr/bin/"
  install -D -m644 LICENSE_MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
