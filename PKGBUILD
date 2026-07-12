# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='Python Server API for LiveKit.'
arch=('any')
_repo='https://github.com/livekit/python-sdks'
url='$_repo/tree/main/livekit-api'
license=('Apache-2.0')
depends=('python' 'python-pyjwt' 'python-aiohttp' 'python-protobuf' 'python-livekit-protocol')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$_repo/archive/refs/tags/api-v$pkgver.tar.gz")
sha256sums=('9462d1eb57a9c3c6af8cfcab9b90170bfaa8a24475e7094cca4dcb4fbbd057db')

build() {
  cd "$srcdir"/python-sdks-${_name//livekit-/}-v$pkgver
  python -m build --wheel --no-isolation $_name
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/python-sdks-${_name//livekit-/}-v$pkgver
  PYTHONPATH=$PWD/$_name pytest "${pytest_options[@]}" tests/${_name//livekit-/}
}

package() {
  cd "$srcdir"/python-sdks-${_name//livekit-/}-v$pkgver
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
