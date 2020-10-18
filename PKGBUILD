# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=cuda-10.2
pkgver=10.2.89
_driverver=440.33.01
pkgrel=3
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc8-libs'  'gcc8' 'opencl-nvidia' 'nvidia-utils')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda-10.2.install
source=(http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda-10.2.conf
        cuda-findgllib_mk.diff)
sha512sums=('ad8da539ff5df7caf411d1e497ff3d6978cfa8a1fd9150fa4846089e92a604ea56be8631f3efdfe7229a655b8d2d28e6edb32f5731530a77d6f00241cc7aab6e'
            '2e660355c25f0f920fd1e29f7eabbed916e051ab10f39a3b783dfa58166e2d49a00fa2ae09374b2ff46c2b448b068a75421b2a939fe989974387f9ebe77dec17'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  for f in builds/cuda-samples/*/*/findgllib.mk; do
    patch $f cuda-findgllib_mk.diff
  done
}

package() {
  install_prefix="${pkgdir}/opt/cuda-10.2"
  mkdir -p "${pkgdir}/opt"

  cd "${srcdir}/builds"
  cp -r cuda-toolkit "${install_prefix}"
  cp -r cublas/include/* "${install_prefix}/include/"
  cp -r cublas/lib64/* "${install_prefix}/lib64/"
  cp -r cuda-samples "${install_prefix}/samples"
  ln -s /opt/cuda-10.2/targets/x86_64-linux/lib "${install_prefix}/lib"
  ln -s /opt/cuda-10.2/nvvm/lib64 "${install_prefix}/nvvm/lib"

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc-8 "${install_prefix}/bin/gcc"
  ln -s /usr/bin/g++-8 "${install_prefix}/bin/g++"

  # Create soname links.
  # We have to be weird about this since for some reason the ELF SONAME is incorrect or at least partially incorrect for some libs.
  # Best we can do is create all symlinks and hope for the best.
  # Their installer used to perform this for us but now it's all manual and I think this is what we'll be stuck with for now.
  find cuda-toolkit/targets -type f -name '*.so*' ! -path '*stubs/*' -print0 | while read -rd $'\0' _lib; do
    _base=${_lib%.so.*}
    _current_soname=$(basename ${_lib%.*})
    while [[ $_current_soname != $(basename $_base) ]]; do
      ln -sf "${_lib##*/}" "${install_prefix}/lib64/$_current_soname"
      _current_soname="${_current_soname%.*}"
    done
  done

  # Install profile and ld.so.config files
  install -Dm644 "${srcdir}/cuda-10.2.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-10.2.conf"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/cuda-10.2/doc/pdf/EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Remove included copy of java and link to system java 8
  rm -fr  "${install_prefix}/jre"
  sed 's|../jre/bin/java|/usr/lib/jvm/java-8-openjdk/jre/bin/java|g' \
    -i "${install_prefix}/libnsight/nsight.ini" \
    -i "${install_prefix}/libnvvp/nvvp.ini"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${install_prefix}"/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${install_prefix}"/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "${install_prefix}/" -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda-10.2|g" "$f"
  done
}

# vim:set ts=2 sw=2 et:

