# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=deepspeech-git
_pkgname=DeepSpeech
pkgver=0.1.1
pkgrel=4
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('sox')
makedepends=('bazel' 'python' 'sox')
source=("git+https://github.com/mozilla/DeepSpeech.git"
	"git+https://github.com/mozilla/tensorflow.git")
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
  export TF_NEED_KAFKA=0
  export TF_NEED_OPENCL_SYCL=0
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_NEED_S3=0
  export TF_ENABLE_XLA=1
  export TF_NEED_GDR=0
  export TF_NEED_VERBS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_MPI=0
  export TF_NEED_TENSORRT=0
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_DOWNLOAD_CLANG=0
  ln -sf ../DeepSpeech/native_client ./
}

build() {
  cd "$srcdir/tensorflow"

  export CC_OPT_FLAGS="-march=native"
  export TF_NEED_CUDA=0
  ./configure
  bazel build -c opt --copt=-O3 //native_client:libctc_decoder_with_kenlm.so
  bazel build --config=monolithic -c opt --copt=-O3 --copt=-fvisibility=hidden //native_client:libdeepspeech.so //native_client:deepspeech_utils //native_client:generate_trie

  cd "${srcdir}/DeepSpeech/native_client"
  TFDIR="${srcdir}/tensorflow" make deepspeech
}

package() {
  cd "${srcdir}/DeepSpeech/native_client"
  TFDIR="${srcdir}/tensorflow" PREFIX="${pkgdir}/usr" make install
}
