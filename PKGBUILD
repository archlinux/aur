# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-${_name}
pkgver=0.22.0
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/python-sdks/tree/main/livekit-rtc'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_audio.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_capture.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_render.wav")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.16/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.16/ffi-linux-arm64.zip")
sha256sums=('273fd75a164fb1be6745ddd624361fba86131be397e629597719f303f2c29730'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80'
            '90626c2c532dfb8313ae52501a9500f1c90235570aab8ff1367e7f91fb697a7e'
            'cf50f57f00fa941ab612c57c24a28811b93c878d3c98edcb4a8f21508aa8e566')
sha256sums_x86_64=('b21ff7c601c2b3f67f41613461b0643c9043aa7ad91abaa9d1438174cff431dc')
sha256sums_aarch64=('b1e68265f0fc23600937ff6600ecbde69bbd77fae08c7cfd3b07fab6682d0d7d')
depends=('python>=3.9' 'python-protobuf' 'python-types-protobuf' 'python-aiofiles')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-requests' 'unzip')
checkdepends=('python-pytest')

prepare(){
  cp test_audio.wav "${srcdir}"/${_name}-${pkgver}/tests/test_audio.wav
  cp test_echo_capture.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_capture.wav
  cp test_echo_render.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_render.wav
  cp "${srcdir}"/liblivekit_ffi.so "${srcdir}"/${_name}-${pkgver}/${_name}/rtc/resources/liblivekit_ffi.so
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
