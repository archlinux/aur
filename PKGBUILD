# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgbase=deepspeech
pkgname=('deepspeech' 'python-deepspeech')
_pkgname=DeepSpeech
pkgver=0.2.0
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture"
arch=('x86_64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
makedepends=('bazel' 'python-numpy' 'python-scipy' 'python-pip' 'python-wheel' 'python-setuptools' 'git' 'sox' 'swig')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla/DeepSpeech/archive/v${pkgver//_/-}.tar.gz"
        "git+https://github.com/mozilla/tensorflow.git#branch=r1.6"
        17508.patch)
sha512sums=('3298a6f1a80865e933796ed386b8988f04d546752e79cc1f18b1adf389523f35fb4e6ae5ce85988da529bfd479b02fccab5c080af27a879d05fce6e617c0ad11'
            'SKIP'
            '18e3b22e956bdd759480d2e94212eb83d6a59381f34bbc7154cadbf7f42686c2f703cc61f81e6ebeaf1da8dc5de8472e5afc6012abb1720cadb68607fba8e8e1')

prepare()
{
	patch -Np1 -i ${srcdir}/17508.patch -d tensorflow
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
	ln -sf "../${_pkgname}-${pkgver//_/-}/native_client" ./
}

build() {
	cd "$srcdir/tensorflow"
	export CC_OPT_FLAGS="-march=x86-64"
	export TF_NEED_CUDA=0
	./configure

	bazel build -c opt --copt=-mtune=generic --copt=-march=x86-64 --copt=-msse \
		--copt=-msse2 --copt=-msse3 --copt=-msse4.1 --copt=-msse4.2 \
		--copt=-mavx --copt="-D_GLIBCXX_USE_CXX11_ABI=0" \
		//native_client:libctc_decoder_with_kenlm.so

	bazel build --config=monolithic -c opt --copt=-mtune=generic \
		--copt=-march=x86-64 --copt=-msse --copt=-msse2 --copt=-msse3 \
		--copt=-msse4.1 --copt=-msse4.2 --copt=-mavx \
		--copt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt=-fvisibility=hidden \
		//native_client:libdeepspeech.so \
		//native_client:generate_trie

	cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
	make deepspeech
    # TODO fix python bindings
	#make bindings
}

package_deepspeech() {
	depends=('sox')
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
	PREFIX=${pkgdir}/usr make install
}

package_python-deepspeech() {
	pkgdesc="DeepSpeech Python bindings"
	depends=('deepspeech' 'python' 'python-scipy' 'python-numpy')
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}/native_client"
	#PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/deepspeech*.whl

	# Reuse deepspeech .so files
	#mv "$pkgdir/usr/bin/deepspeech" "$pkgdir/usr/bin/deepspeech_python"
	#rm -rf "$pkgdir/usr/lib/python3.6/site-packages/deepspeech/lib"
	#ln -s /usr/lib "$pkgdir/usr/lib/python3.6/site-packages/deepspeech/lib"
}
