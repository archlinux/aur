# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-${_name}
pkgver=0.20.0
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/python-sdks/tree/main/livekit-rtc'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/livekit/python-sdks/raw/refs/tags/rtc-v${pkgver}/livekit-rtc/tests/test_audio.wav")


source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.10/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/rust-sdks/livekit-ffi@0.12.10/ffi-linux-arm64.zip")
sha256sums=('fdeecc1d2df9bb4c6a90703947f70390d6f65fbfd290d678e138c2a88a1b43e5'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80')
sha256sums_x86_64=('a3143a8ddd11a5f4e6659109f9c0973e9029f38e457efe4178914fe639309256')
sha256sums_aarch64=('797018dad71e18112abb9dd5eadbfc17eb899f1a1241c62d81a6e6d7c459032c')
depends=('python>=3.9' 'python-protobuf' 'python-types-protobuf' 'python-aiofiles')
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
