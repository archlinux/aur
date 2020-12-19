pkgbase=deepspeech
pkgname=('deepspeech' 'python-deepspeech')
_pkgname=DeepSpeech
pkgver=0.9.3
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
makedepends=('bazel' 'python-numpy' 'python-pip' 'python-wheel' 'git' 'sox' 'wget')
source=("${_pkgname}-${pkgver}::git+https://github.com/mozilla/DeepSpeech.git#tag=v${pkgver}")
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

  bazel build --workspace_status_command="bash native_client/bazel_workspace_status_cmd.sh" --config=monolithic -c opt --copt=-O3 --copt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt=-fvisibility=hidden //native_client:libdeepspeech.so

  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  make deepspeech SOX_LDFLAGS="-lsox -Wl,-no-undefined"
  make bindings -C python
  make bindings -C ctcdecode
}

package_deepspeech() {
  depends=('sox')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PREFIX="${pkgdir}"/usr make install
}

package_python-deepspeech() {
  pkgdesc="DeepSpeech Python bindings"
  depends=('deepspeech' 'python-numpy')
  cd "${srcdir}/${_pkgname}-${pkgver}/native_client"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps python/dist/deepspeech*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ctcdecode/dist/ds_ctcdecoder*.whl
  mv "$pkgdir/usr/bin/deepspeech" "$pkgdir/usr/bin/deepspeech_python"
  cp -rv "${srcdir}/${_pkgname}-${pkgver}/training/deepspeech_training" "$pkgdir"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
}
