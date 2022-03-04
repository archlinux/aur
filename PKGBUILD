pkgbase=stt-train
pkgname=('stt-train' 'python-stt')
_pkgname=STT
pkgver=1.2.0
pkgrel=1
pkgdesc="Coqui-STT for training"
arch=('x86_64')
url="https://github.com/coqui-ai/STT"
license=('MPL2')
makedepends=('bazel<4' 'python-numpy' 'python-pip' 'python-wheel' 'git' 'sox' 'wget')
source=("${_pkgname}-${pkgver}::git+https://github.com/coqui-ai/STT.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare()
{
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
  export CC_OPT_FLAGS="-march=x86-64"
  rm .bazelversion
  ./configure

  bazel build --workspace_status_command="bash native_client/bazel_workspace_status_cmd.sh" --config=monolithic -c opt --copt=-O3 --copt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt=-fvisibility=hidden //native_client:libstt.so

  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  make deepspeech SOX_LDFLAGS="-lsox -Wl,-no-undefined"
  make bindings -C python
  make bindings -C ctcdecode
}

package_stt() {
  depends=('sox')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PREFIX="${pkgdir}"/usr make install
}

package_python-stt() {
  pkgdesc="Coqui STT Python bindings"
  depends=('stt' 'python-numpy')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps python/dist/stt*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ctcdecode/dist/coqui_stt_ctcdecoder*.whl
  mv "$pkgdir/usr/bin/stt" "$pkgdir/usr/bin/stt_python"
  cp -rv "${srcdir}/${_pkgname}-${pkgver}/training/coqui_stt_training" "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}
