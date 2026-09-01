# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-$_name
pkgver=1.1.17
_livekit_ffi_ver=0.12.68
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
_repo='https://github.com/livekit/python-sdks'
url="$_repo/tree/main/livekit-rtc"
license=('Apache-2.0')
depends=('python' 'python-protobuf' 'python-aiofiles' 'python-numpy' 'glibc' 'gcc-libs')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-requests')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-matplotlib' 'python-pydantic' 'python-livekit-api')
source=("$_repo/archive/refs/tags/rtc-v$pkgver.tar.gz"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures/test_audio.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures//test_echo_capture.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures//test_echo_render.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures//test_processed.wav")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/livekit-ffi/v$_livekit_ffi_ver/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/livekit-ffi/v$_livekit_ffi_ver/ffi-linux-arm64.zip")
sha256sums=('1eb986fa4d4d1cfbb0890be222abedc4b8495e3448e9e5f542e03d8aaba85566'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80'
            '90626c2c532dfb8313ae52501a9500f1c90235570aab8ff1367e7f91fb697a7e'
            'cf50f57f00fa941ab612c57c24a28811b93c878d3c98edcb4a8f21508aa8e566'
            '8a48eb2f6a2143b4bc6adfe306983637f628fffc9d550c60b4ebcecd506d6245')
sha256sums_x86_64=('9e8818b1af2a57f5f587fb4996d5d55557dea2e332fc18c184a8840ed0515bf1')
sha256sums_aarch64=('337a4511a89f02da3518aab7899a77fd7811fff4874cc078bdd7fd553f1896cd')

prepare(){
  cp -f "$srcdir"/test_audio.wav "$srcdir"/python-sdks-rtc-v$pkgver/tests/rtc/fixtures/test_audio.wav
  cp -f "$srcdir"/test_echo_capture.wav "$srcdir"/python-sdks-rtc-v$pkgver/tests/rtc/fixtures/test_echo_capture.wav
  cp -f "$srcdir"/test_echo_render.wav "$srcdir"/python-sdks-rtc-v$pkgver/tests/rtc/fixtures/test_echo_render.wav
  cp -f "$srcdir"/test_processed.wav "$srcdir"/python-sdks-rtc-v$pkgver/tests/rtc/fixtures/test_processed.wav
  cp -f "$srcdir"/liblivekit_ffi.so "$srcdir"/python-sdks-rtc-v$pkgver/$_name-rtc/$_name/rtc/resources/liblivekit_ffi.so
  cp -f "$srcdir"/livekit_ffi.h "$srcdir"/python-sdks-rtc-v$pkgver/$_name-rtc/$_name/rtc/resources/livekit_ffi.h
}

build() {
  cd "$srcdir"/python-sdks-rtc-v$pkgver
  python -m build --wheel --no-isolation $_name-rtc
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/python-sdks-rtc-v$pkgver
  PYTHONPATH=$PWD/$_name-rtc pytest "${pytest_options[@]}" $_name-rtc/tests tests/rtc
}

package() {
  cd "$srcdir"/python-sdks-rtc-v$pkgver/$_name-rtc
  python -m installer --destdir="$pkgdir" dist/*.whl
}
