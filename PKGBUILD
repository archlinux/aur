# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=deepspeech
pkgver=0.1.0
pkgrel=2
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
makedepends=('bazel' 'python-numpy' 'python-pip' 'python-wheel' 'python-setuptools')
depends=('python-tensorflow' 'python-scipy')
source=("deepspeech-${pkgver}.tar.gz:https://github.com/mozilla/DeepSpeech/archive/v${pkgver}.tar.gz"
	"git+https://github.com/mozilla/tensorflow.git")
sha512sums=('4103ac9bd5cd313f87ad2786133aafb70211f420e1856187cf47ab7f6bc824f79033b8fbae7a3e2d8981a5f63d61b8f5428e0ffe5c849333dc7d9e2c710a1f3a'
	    'SKIP')

prepare() {
  cd "$srcdir/tensorflow"
  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export TF_NEED_JEMALLOC=1
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_NEED_S3=0
  export TF_ENABLE_XLA=1
  export TF_NEED_GDR=0
  export TF_NEED_VERBS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_MPI=0
  ln -sf ../DeepSpeech-${pkgver}/native_client ./
}

build() {
  cd "$srcdir/tensorflow"
  export CC_OPT_FLAGS="-march=x86-64"
  export TF_NEED_CUDA=0
  ./configure
  bazel build -c opt --copt=-O3 //tensorflow:libtensorflow_cc.so //tensorflow:libtensorflow_framework.so //native_client:deepspeech //native_client:deepspeech_utils //native_client:ctc_decoder_with_kenlm //native_client:generate_trie

  cd "${srcdir}/DeepSpeech-${pkgver}/native_client"
  make deepspeech
}

package() {
  cd "${srcdir}/DeepSpeech-${pkgver}/native_client"
  PREFIX=${pkgdir}/usr/local make install
}
