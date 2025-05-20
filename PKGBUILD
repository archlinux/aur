# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-${_name}
pkgver=1.0.8
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/python-sdks/tree/main/livekit-rtc'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_audio.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_capture.wav"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_echo_render.wav")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.25/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.25/ffi-linux-arm64.zip")
sha256sums=('75ce8d9e1d62e9322b8fb4638e4402a032179801b469fba9339698ea2acc6a70'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80'
            '90626c2c532dfb8313ae52501a9500f1c90235570aab8ff1367e7f91fb697a7e'
            'cf50f57f00fa941ab612c57c24a28811b93c878d3c98edcb4a8f21508aa8e566')
sha256sums_x86_64=('50aee19363e39b873ee454950a4fbc7504fdf5bd19d3edf5c5f867d2e8bc1d3b')
sha256sums_aarch64=('24384de03ff5b7c58a2ac08e7afc9157412527fee560d4c35ad788e09850e157')
depends=('python' 'python-protobuf' 'python-aiofiles' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-requests' 'unzip')
checkdepends=('python-pytest')

prepare(){
  mv test_audio.wav "${srcdir}"/${_name}-${pkgver}/tests/test_audio.wav
  mv test_echo_capture.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_capture.wav
  mv test_echo_render.wav "${srcdir}"/${_name}-${pkgver}/tests/test_echo_render.wav
  mv "${srcdir}"/liblivekit_ffi.so "${srcdir}"/${_name}-${pkgver}/${_name}/rtc/resources/liblivekit_ffi.so
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
