# NiceHash equihash miner. CPU xenocat solver build
# Maintainer: Sebastian Stammler <echo c2ViQGhkZG4uc3BhY2UK|base64 -d>
_flavour="cpu"
pkgname="nheqminer-${_flavour}-git"
pkgver=0.5c.r1.gb9900ff
pkgrel=2
pkgdesc="zcash equihash miner by NiceHash. Xenoncat CPU solver build."
arch=('x86_64')
url="https://github.com/nicehash/nheqminer/"
license=('MIT')
depends=('boost')
makedepends=('git' 'cmake')
optdepends=('zcash: zcash node and tools')
source=("${pkgname}::git+https://github.com/nicehash/nheqminer.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_dir="build_${_flavour}"
build() {
  cd "${pkgname}/cpu_xenoncat/asm_linux/"
  chmod a+x fasm # Until my PR #226 is merged...
  sh assemble.sh
  cd "../../"
  # Fix hardcoded sources path
  sed -ie 's#\.\.\/nheqminer#\.\.\/'"${pkgname}"'#g' CMakeLists.txt
  cd ..
  mkdir -p ${_build_dir}
  cd ${_build_dir}
  # Since we don't use make install, skip setting RPATH in the binary
  cmake -DCMAKE_SKIP_BUILD_RPATH=true \
    -DUSE_CUDA_DJEZO=false \
    ../${pkgname}

  make -j $(nproc)
}

package() {
  install -D -m755 "${_build_dir}/nheqminer" "${pkgdir}/usr/bin/nheqminer_${_flavour}"
  install -D -m644 "${pkgname}/LICENSE_MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
