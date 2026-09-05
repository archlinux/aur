pkgname=piper-tts
_pkgname=piper1-gpl
pkgver=1.8.0
pkgrel=1
pkgdesc="Fast and local neural text-to-speech engine"
arch=('x86_64')
url="https://github.com/OHF-Voice/piper1-gpl"
license=('GPL-3.0-or-later')
provides=('piper-tts')
conflicts=('piper-tts' 'piper')
depends=(glibc onnxruntime python-numpy python-onnxruntime python-pathvalidate)
optdepends=(
	'espeak-ng: dictionaries'
	'python-flask: http server'
	'python-onnx: patch voice with alignment'
	'python-pytorch: train'
)
makedepends=(git python-setuptools python-build python-installer python-wheel python-scikit-build cmake ninja)
source=("git+https://github.com/OHF-Voice/piper1-gpl.git#tag=v$pkgver")
sha256sums=('70d062c1e80b0967b311f53e6036d9c78e146a6065d7444f3cec4a2fe85d2ea5')

prepare() {
	cd ${_pkgname}
	sed -i 's/"cmake", "ninja"//' pyproject.toml
}

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation

  local cmake_options=(
    -B build
    -S libpiper
    -DCMAKE_INSTALL_PREFIX=/usr
    -DPIPER_BUILD_TESTS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local ctest_flags=(
    --test-dir ${_pkgname}/build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
  )
  ctest "${ctest_flags[@]}"
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  DESTDIR="$pkgdir" cmake --install build

  # avoid conflict with GTK application 'piper'
  mv "$pkgdir"/usr/bin/piper "$pkgdir"/usr/bin/piper-tts

  rm "$pkgdir"/usr/COPYING
  rm -r "$pkgdir"/usr/share
}

