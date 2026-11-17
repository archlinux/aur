# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit
pkgname=python-$_name
pkgver=1.3.0
_livekit_ffi_ver=0.14.0
pkgrel=1
pkgdesc="Python Real-time SDK for LiveKit."
arch=('x86_64' 'aarch64')
_repo='https://github.com/livekit/python-sdks'
url="$_repo/tree/main/livekit-rtc"
license=('Apache-2.0')
depends=('python'
         'python-protobuf'
         'python-aiofiles'
         'python-numpy'
         'glibc'
         'gcc-libs')
makedepends=('python-setuptools'
             'python-wheel'
             'python-requests'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-livekit-api')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/rtc-v$pkgver.tar.gz"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures/test_audio.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures/test_echo_capture.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures/test_echo_render.wav"
        "$_repo/raw/refs/tags/rtc-v$pkgver/tests/rtc/fixtures/test_processed.wav")
source_x86_64=("https://github.com/livekit/rust-sdks/releases/download/livekit-ffi/v$_livekit_ffi_ver/ffi-linux-x86_64.zip")
source_aarch64=("https://github.com/livekit/rust-sdks/releases/download/livekit-ffi/v$_livekit_ffi_ver/ffi-linux-arm64.zip")
sha256sums=('a63dadc2faa2b81e14dafadc2ca5bca84d20414aeb1b594ea0616495ba3342da'
            'ac5cba8b2477ab55c9bc5f95faffcd3d9b9ad4e6a01d79308fbe6eeef733ce80'
            '90626c2c532dfb8313ae52501a9500f1c90235570aab8ff1367e7f91fb697a7e'
            'cf50f57f00fa941ab612c57c24a28811b93c878d3c98edcb4a8f21508aa8e566'
            '8a48eb2f6a2143b4bc6adfe306983637f628fffc9d550c60b4ebcecd506d6245')
sha256sums_x86_64=('99881912a93d19756eb72f7c2312a1745f36a0933411c06a2a87936eb50d6944')
sha256sums_aarch64=('53353fc69235885c799373b64a1f909277f63b1a9c7185cbbde6124fbf701cf7')

prepare(){
  cd "python-sdks-rtc-v$pkgver"
  # Use the setuptools version shipped by Arch
  sed -i '/^requires = \[/,/\]/s/"setuptools[<>=!~][^"]*"/"setuptools"/' $_name-rtc/pyproject.toml
  cp -f "$srcdir"/test_audio.wav tests/rtc/fixtures/test_audio.wav
  cp -f "$srcdir"/test_echo_capture.wav tests/rtc/fixtures/test_echo_capture.wav
  cp -f "$srcdir"/test_echo_render.wav tests/rtc/fixtures/test_echo_render.wav
  cp -f "$srcdir"/test_processed.wav tests/rtc/fixtures/test_processed.wav
  cp -f "$srcdir"/liblivekit_ffi.so $_name-rtc/$_name/rtc/resources/liblivekit_ffi.so
  cp -f "$srcdir"/livekit_ffi.h $_name-rtc/$_name/rtc/resources/livekit_ffi.h
}

build() {
  cd "python-sdks-rtc-v$pkgver"
  python -m build --wheel --no-isolation $_name-rtc
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "python-sdks-rtc-v$pkgver"
  PYTHONPATH=$PWD/$_name-rtc pytest "${pytest_options[@]}" tests/rtc $_name-rtc/tests
}

package() {
  cd "python-sdks-rtc-v$pkgver/$_name-rtc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
