pkgbase=stt
pkgname=('stt' 'python-stt')
_pkgname=STT
pkgver=1.3.0
pkgrel=1
pkgdesc="Coqui-STT for inference"
arch=('x86_64' 'aarch64' 'armv7' 'amd64')
url="https://github.com/coqui-ai/STT"
license=('MPL2')
makedepends=('cmake' 'bazel' 'git' 'sox' 'wget' 'swig')
makedepends_x86_64=('gcc10')
makedepends_aarch64=('aarch64-aarch64-none-elf-gcc-10.3-bin')
depends=('python' 'sox')
source=("${_pkgname}-${pkgver}::git+https://github.com/coqui-ai/STT.git#tag=v${pkgver}")
sha256sums=('SKIP')
provides=('stt' 'python-stt')
conflicts=('python-stt-bin' 'stt-bin')

prepare()
{
  python -m ensurepip --upgrade --default-pip
  pip install -U wheel numpy
  cd "$srcdir/${_pkgname}-${pkgver}"
  git submodule sync tensorflow/
  git submodule update --init tensorflow/
  cd tensorflow
  ln -sf ../native_client

}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}/tensorflow"
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export TF_NEED_OPENCL_SYCL=0
  export TF_ENABLE_XLA=1
  export TF_NEED_MPI=0
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_NEED_ROCM=0
  export TF_DOWNLOAD_CLANG=0
  export TF_NEED_CUDA=0
  if [[ $arch == "x86_64" ]]; then
    export CC=/usr/bin/gcc-10
    export CXX=/usr/bin/g++-10
  elif [[ $arch == "aarch64" ]]; then
    export CC=/usr/bin/aarch64-none-elf-gcc
    export CXX=/usr/bin/aarch64-none-elf-g++
  fi;
  export CC_OPT_FLAGS="-march=${arch}"
  #rm .bazelversion
  ./configure
  
  if [[ $arch == "x86_64" ]]; then
    bazel build \
        --workspace_status_command="bash native_client/bazel_workspace_status_cmd.sh" \
          -c opt \
          --copt=-mtune=generic \
          --copt=-march=x86-64 \
          --copt=-msse \
          --copt=-msse2 \
          --copt=-msse3 \
          --copt=-msse4.1 \
          --copt=-msse4.2 \
          --copt=-mavx \
          --config=noaws \
          --config=nogcp \
          --config=nohdfs \
          --config=nonccl \
          --copt="-D_GLIBCXX_USE_CXX11_ABI=0" \
        //native_client:libstt.so
  elif [[ $arch == "aarch64" ]]; then
    bazel build \
        --workspace_status_command="bash native_client/bazel_workspace_status_cmd.sh" \
        --config=monolithic \
          -c opt \
          --config=elinux_aarch64 \
        //native_client:libstt.so
  fi;
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  if [[ $arch == "x86_64" ]]; then
    make stt SOX_LDFLAGS="-lsox -Wl,-no-undefined"
  elif [[ $arch == "aarch64" ]]; then
    make TARGET=rpi3-armv8 stt SOX_LDFLAGS="-lsox -Wl,-no-undefined"
  fi;
  make bindings -C python
  #make bindings -C ctcdecode
}

package_stt() {
  depends=('sox' 'python-libclang')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PREFIX="${pkgdir}"/usr make install
}

package_python-stt() {
  pkgdesc="Coqui STT Python bindings"
  depends=('stt' 'python-numpy')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps python/dist/STT-*.whl
  #PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ctcdecode/dist/*.whl
  #mv "$pkgdir/usr/bin/stt" "$pkgdir/usr/bin/stt_python"
  cp -rv "${srcdir}/${_pkgname}-${pkgver}/training/coqui_stt_training" "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}
