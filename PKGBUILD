# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgbase=cuda11.1
pkgname=('cuda11.1' 'cuda11.1-tools')
pkgver=11.1.1
_driverver=455.32.00
pkgrel=2
pkgdesc="NVIDIA's GPU programming toolkit (version 11.1)"
arch=('x86_64')
url='https://developer.nvidia.com/cuda-zone'
license=('custom:NVIDIA')
depends=('gcc-libs' 'gcc' 'opencl-nvidia' 'nvidia-utils' 'python')
optdepends=('gdb: for cuda-gdb')
provides=('cuda-toolkit' 'cuda-sdk')
replaces=('cuda-toolkit' 'cuda-sdk')
options=('!strip' 'staticlibs')
install=cuda.install
source=("http://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run"
        'cuda.sh'
        'cuda.conf'
        'cuda-findgllib_mk.patch'
        'accinj64.pc' 'cublas.pc' 'cuda.pc' 'cudart.pc' 'cufft.pc' 'cufftw.pc' 'cuinj64.pc' 'curand.pc' 'cusolver.pc'
        'cusparse.pc' 'nppc.pc' 'nppial.pc' 'nppicc.pc' 'nppicom.pc' 'nppidei.pc' 'nppif.pc' 'nppig.pc' 'nppim.pc' 'nppi.pc'
        'nppist.pc' 'nppisu.pc' 'nppitc.pc' 'npps.pc' 'nvgraph.pc' 'nvidia-ml.pc' 'nvjpeg.pc' 'nvrtc.pc' 'nvToolsExt.pc')
sha256sums=('3eae6727086024925ebbcef3e9a45ad379d8490768fd00f9c2d8b6fd9cd8dd8f'
            '2a1c3d55d15a8b816f9dd2947ef3d0afaf748fb0dc4ec21f260c04e065769ac9'
            'a65f7d96e2447eb40b1be9586b90eb0bd776a8938c93d21f9606d2880b548b28'
            '958ef464478ef960ca07476990942ad4c656b9823cc0ef71ce0e97fcaa82c887'
            '3654c4773f1e3f70092098b6bb52f7c095ed43ee9a61067cc8876ad6fb03cedd'
            '6878fe674bb533c021b920c2f3d4fc0b95454eb6141b5ccac57a74eca9904b92'
            '6e38217476185b8e6a633f3e4596f34492f0e0880b5de53c38add6faab154d1f'
            '4be68975d323ff26b17ac477a8fdde3060f1e68ff3eae4a0a82a52f46cf5d57d'
            'ab905fddc2c5593dd6d9ca011dfdfb5fee35986132a864b5180d10f2e8e6fe53'
            '63e7df2965ef1c94af536bf82a5e3b1225793902c72017e9a9feac977488d2f5'
            '3610ce81ca80c6f68ec3bc30e192f51b1b8094884431aa5821326135ffc09b48'
            'aaa0b71bbe54ad5c92ad4447ac542628c8f12781d1dd3fc9450662062fa8348d'
            '7a53c0fbca16cf1c0ddfa389d697d345e96112e38d5bfb00e4bedba49df1a8e9'
            'd5e4355337cce3c87eec1d15369e9cdca3d1028b212a1c3e66784a1edec0c2e5'
            '206e18de162d9cc62bad19aaf5df5f5609fc9cba87d2e4bfd3453f849edc9f12'
            'ad07b922bb5203925c426709cc995c83f9b103bbe71d8ca406517332ef3081e2'
            'c7beeba38c2f0bcc47f4e6388124fd73ed5266d9345ff02c65bb6fe41c006073'
            'd91f226fd4f3723e6bd04f63dcb2a4cd0246edf46461a7bac75464392ebf7798'
            '2ef2365d1b9c8e1cee37d2352ce20ddd33e0b955a9a9a206ff4135267675ea87'
            '51a951b78b1568be629e60d4f5be71c7c1a3eb463fa16abf37ec73b87f70434e'
            '04a8c95046183e9e79d00bc029b276625d074854f36ccb25ac5f8c78bf00e44e'
            '3f2c846828ed83ca94ef1b3d47a2feed6e56f515b0a0f743780475ab9f1af641'
            'ac1d0653d8a6f0df4de8e59762eefefe3a8bb62ac84aa00e26bcfa1433081459'
            '0228de3a302889009fbafdc50589657e219ed9b30346c2da82ea70bda7679399'
            '0a46b8bd52b669ddf26010f75d32baf07e0156b881d2e2befddefd0ab3d1933a'
            'a379d9d9127333a879db7db7f0a11eb391f5c0d81f63f700d7b5c0956b3fd81c'
            '7012e58213068b9ebcde0ee1eb484898ed38f540860ea9983e7d3949b1f3376b'
            '868e45474f3fb08aecb6b09d2bedfb28e830a2a1c386b18d4f8e6191cf70459a'
            '7bb1e1b564ffeb545eb125ec58ee9b5f77819fe0f3a4961229fa2906d519c532'
            '9355be826b43e6009ce1bf5a037cf9559389c2ff3592e6c1206740f3fe9b0ee1'
            'e8e417400406a976e96c08b1522920543097e2a08ac3417ce574155980c5558f'
            '87ac1265d4f9d35f6d68de9205647c46e8f2523458e8d28b65c57af4e0b27d5d')

prepare() {
  sh "cuda_${pkgver}_${_driverver}_linux.run" --target "$srcdir" --noexec

  # Fix up samples that use findgllib.mk
  local _file
  while read -r -d '' _file
  do
    patch -Np1 -i cuda-findgllib_mk.patch "$_file"
  done < <(find builds/cuda_samples -type f -name 'findgllib.mk' -print0)
}

build() {
  local _prepdir="${srcdir}/prep"

  cd builds

  rm -r NVIDIA*.run bin
  mkdir -p "${_prepdir}/opt/cuda/extras"
  mv cuda_samples "${_prepdir}/opt/cuda/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${_prepdir}/opt/cuda"
  mv cuda_sanitizer_api/compute-sanitizer "${_prepdir}/opt/cuda/extras/compute-sanitizer"
  rmdir cuda_sanitizer_api
  local _lib
  while read -r -d '' _lib
  do
    cp -r "$_lib"/* "${_prepdir}/opt/cuda/"
  done < <(find . -mindepth 1 -maxdepth 1 -type d -print0)

  # Delete some unnecessary files
  rm -r "$_prepdir"/opt/cuda/{bin/cuda-uninstaller,samples/bin/cuda-uninstaller}

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc "${_prepdir}/opt/cuda/bin/gcc"
  ln -s /usr/bin/g++ "${_prepdir}/opt/cuda/bin/g++"

  # Install profile and ld.so.config files
  install -D -m755 "${srcdir}/cuda.sh" "${_prepdir}/etc/profile.d/cuda.sh"
  install -D -m644 "${srcdir}/cuda.conf" "${_prepdir}/etc/ld.so.conf.d/cuda.conf"

  # Install pkgconfig files
  mkdir -p "$_prepdir"/usr/lib/pkgconfig
  cp "$srcdir"/*.pc "$_prepdir"/usr/lib/pkgconfig

  mkdir -p "${_prepdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${_prepdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "$_prepdir"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "$_prepdir"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  local _file
  while read -r -d '' _file
  do
    sed -i 's|/usr/local/cuda|/opt/cuda|g' "$_file"
  done < <(find "${_prepdir}/opt/cuda" -type f -name 'Makefile' -print0)
}

package_cuda11.1() {
  provides+=('cuda=11.1')
  conflicts+=('cuda')
  replaces+=('cuda-static')

  local _prepdir="${srcdir}/prep"

  cd "$_prepdir"
  cp -al * "$pkgdir"

  rm -r "$pkgdir"/opt/cuda/{bin/nvvp,bin/computeprof,libnvvp,nsight*}
}

package_cuda11.1-tools() {
  pkgdesc="NVIDIA's GPU programming toolkit (extra tools: nvvp, nsight) (version 11.1)"
  depends=('cuda=11.1' 'java-runtime=8' 'nss')
  provides+=('cuda-tools=11.1')
  conflicts+=('cuda-tools')

  local _prepdir="${srcdir}/prep"

  mkdir -p "${pkgdir}/opt/cuda/bin"
  mv "$_prepdir"/opt/cuda/nsight* "${pkgdir}/opt/cuda"
  mv "$_prepdir"/opt/cuda/bin/nvvp "${pkgdir}/opt/cuda/bin/nvvp"
  mv "$_prepdir"/opt/cuda/bin/computeprof "${pkgdir}/opt/cuda/bin/computeprof"
  mv "$_prepdir"/opt/cuda/libnvvp "${pkgdir}/opt/cuda"
}
