# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=deepspeech-git
_pkgname=DeepSpeech
pkgver=0.1.1
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
makedepends=('bazel' 'python-numpy' 'python-pip' 'python-wheel' 'python-setuptools')
depends=('python-tensorflow' 'python-scipy')
source=("git+https://github.com/mozilla/DeepSpeech.git"
	"git+https://github.com/tensorflow/tensorflow.git")
sha512sums=('SKIP'
	    'SKIP')

#pkgver() {
#  cd "$_pkgname"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
