# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Konstantin Gizdov <arch@kge.pw>
# Maintainer: Sinan Tan <i@tinytangent.com>
pkgname=cuda-10.1
pkgver=10.1.243
_driverver=418.87.00
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc8-libs'  'gcc8' 'opencl-nvidia' 'nvidia-utils>=418.39')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda.sh
        cuda.conf
        cuda-findgllib_mk.diff)
sha512sums=('f92b19d0242969a65a6e6db43bc293e442abc07a9e168c9e995692e1a401679504598c782e511be3879e1650b90f71a50bbc63c9ee45654c26b5007cdf33c4fe'
            'a380116cb5358d057b33b521b94fec4463b18511591b30e351ae1a8dbfc9e0d1d335f0e600c35bcc6aabb55f81178ee9efa1556768fe8279d7f33bd4910b7904'
            'd17fd6535324e87d0171feaf2f97b60f77897d9f72b26fcf724ccc2bc0e0cc98ef5518e398437377873d4304c124a25c9d137144b5f42784920c663280bda036'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  for f in builds/cuda-samples/*/*/findgllib.mk; do
    patch $f cuda-findgllib_mk.diff
  done
}

package() {
  mkdir -p "${pkgdir}/opt/"

  cd "${srcdir}/builds"
  cp -r cuda-toolkit "${pkgdir}/opt/cuda-10.1"
  cp -r cublas/include/* "${pkgdir}/opt/cuda-10.1/include/"
  cp -r cublas/lib64/* "${pkgdir}/opt/cuda-10.1/lib64/"
  cp -r cuda-samples "${pkgdir}/opt/cuda-10.1/samples"
  ln -s /opt/cuda-10.1/targets/x86_64-linux/lib "${pkgdir}/opt/cuda-10.1/lib"
  ln -s /opt/cuda-10.1/nvvm/lib64 "${pkgdir}/opt/cuda-10.1/nvvm/lib"

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc-8 "${pkgdir}/opt/cuda-10.1/bin/gcc"
  ln -s /usr/bin/g++-8 "${pkgdir}/opt/cuda-10.1/bin/g++"

  # Create soname links.
  # We have to be weird about this since for some reason the ELF SONAME is incorrect or at least partially incorrect for some libs.
  # Best we can do is create all symlinks and hope for the best.
  # Their installer used to perform this for us but now it's all manual and I think this is what we'll be stuck with for now.
  find cuda-toolkit/targets -type f -name '*.so*' ! -path '*stubs/*' -print0 | while read -rd $'\0' _lib; do
    _base=${_lib%.so.*}
    _current_soname=$(basename ${_lib%.*})
    while [[ $_current_soname != $(basename $_base) ]]; do
      ln -sf ${_lib##*/} ${pkgdir}/opt/cuda-10.1/lib64/$_current_soname
      _current_soname=${_current_soname%.*}
    done
  done

  # Install profile and ld.so.config files
  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda-10.1.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-10.1.conf"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda-10.1/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Remove included copy of java and link to system java 8
  rm -fr  "${pkgdir}/opt/cuda-10.1/jre"
  sed 's|../jre/bin/java|/usr/lib/jvm/java-8-openjdk/jre/bin/java|g' \
    -i "${pkgdir}/opt/cuda-10.1/libnsight/nsight.ini" \
    -i "${pkgdir}/opt/cuda-10.1/libnvvp/nvvp.ini"

  # Allow GCC 9 to work
  sed -i "/.*unsupported GNU version.*/d" "${pkgdir}"/opt/cuda-10.1/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$pkgdir"/opt/cuda-10.1 -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda-10.1|g" "$f"
  done
}

# vim:set ts=2 sw=2 et:

