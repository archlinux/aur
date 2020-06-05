pkgbase=deepspeech
pkgname=('deepspeech' 'python-deepspeech')
_pkgname=DeepSpeech
pkgver=0.7.3
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
makedepends=('bazel=0.24.1' 'python-numpy' 'python-pip' 'python-wheel' 'git' 'sox')
source=("${_pkgname}-${pkgver}::git+https://github.com/mozilla/DeepSpeech.git#tag=v${pkgver//_/-}"
        "git+https://github.com/mozilla/tensorflow.git#branch=r1.15")
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd "$srcdir/tensorflow"
  ln -sf "../${_pkgname}-${pkgver//_/-}/native_client" ./
}

build() {
  cd "$srcdir/tensorflow"
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
  ./configure

  bazel build --workspace_status_command="bash native_client/bazel_workspace_status_cmd.sh" --config=monolithic -c opt --copt=-O3 --copt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt=-fvisibility=hidden //native_client:libdeepspeech.so

  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
  make deepspeech SOX_LDFLAGS="-lsox -Wl,-no-undefined"
  make bindings -C python
  make bindings -C ctcdecode
}

package_deepspeech() {
  depends=('sox')
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
  PREFIX="${pkgdir}"/usr make install
}

package_python-deepspeech() {
  pkgdesc="DeepSpeech Python bindings"
  depends=('deepspeech' 'python-numpy')
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps python/dist/deepspeech*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ctcdecode/dist/ds_ctcdecoder*.whl
  mv "$pkgdir/usr/bin/deepspeech" "$pkgdir/usr/bin/deepspeech_python"
  cp -rv "${srcdir}/${_pkgname}-${pkgver//_/-}/training/deepspeech_training" "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}
