# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-${_name}
pkgver=0.19.1
pkgrel=2
pkgdesc="The LiveKit Python SDK provides a convenient interface for integrating LiveKit's real-time video and audio capabilities into your Python applications."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/python-sdks/$_name-rtc'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_audio.wav")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/latest/download/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/latest/download/ffi-linux-arm64.zip")
sha256sums=('0895fed8c2cc815b82ed5cf734eed2c7f8da07ff74ede164816924fd9d170826'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80')
sha256sums_x86_64=('23a465480bb27b6dc475ea7edddfe497f4751ee1d3a55436263313fe3cf8cba8')
sha256sums_aarch64=('e61f9e50956342af0d381c3c543036909a8b9ed10163eda9f47d52c54d891c5b')
depends=('python>=3.9')
makedepends=('python-setuptools' 'python-wheel' 'python-requests' 'unzip')
checkdepends=('python-pytest')

prepare(){
  cp test_audio.wav "${srcdir}"/${_name}-${pkgver}/tests/test_audio.wav
  cp "${srcdir}"/liblivekit_ffi.so "${srcdir}"/${_name}-${pkgver}/${_name}/rtc/resources/liblivekit_ffi.so
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
