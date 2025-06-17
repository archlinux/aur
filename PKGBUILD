# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-${_name}
pkgver=1.0.9
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/python-sdks/tree/main/livekit-rtc'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_audio.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_capture.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_render.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_processed.wav"
        "https://raw.githubusercontent.com/livekit/rust-sdks/refs/tags/rust-sdks/livekit-ffi@0.12.26/livekit-ffi/include/livekit_ffi.h")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.26/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.26/ffi-linux-arm64.zip")
sha256sums=('573099cd2f09aa0c83a78efe492e927cda749cc7fea6eb41bff9eceea0ab42ed'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80'
            '90626c2c532dfb8313ae52501a9500f1c90235570aab8ff1367e7f91fb697a7e'
            'cf50f57f00fa941ab612c57c24a28811b93c878d3c98edcb4a8f21508aa8e566'
            '8a48eb2f6a2143b4bc6adfe306983637f628fffc9d550c60b4ebcecd506d6245'
            '43c1a94e3ed4a699e64571d8f4e241919322a1d3655a1a9be53f111cf209b245')
sha256sums_x86_64=('40282e0c2a866ec38a8654ac534126c6388dae013a7fa35089bf8600780d6671')
sha256sums_aarch64=('6265c43205c7808fb0289bef5a00ddda9c8c3a733d599a776967c12e3cd4f7b6')
depends=('python' 'python-protobuf' 'python-aiofiles' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-requests' 'unzip')
checkdepends=('python-pytest' 'python-pytest-asyncio')

prepare(){
  mv -f test_audio.wav "${srcdir}"/${_name}-${pkgver}/tests/test_audio.wav
  mv -f test_echo_capture.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_capture.wav
  mv -f test_echo_render.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_render.wav
  mv -f test_processed.wav "${srcdir}"/${_name}-${pkgver}/tests/test_processed.wav
  mv -f liblivekit_ffi.so "${srcdir}"/${_name}-${pkgver}/${_name}/rtc/resources/liblivekit_ffi.so
  mv -f livekit_ffi.h "${srcdir}"/${_name}-${pkgver}/${_name}/rtc/resources/livekit_ffi.h
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
