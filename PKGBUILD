# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=1.1.1
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
sha256sums=('d8d6703adf89d03ce0bc3636492c6c9c1208433401e2e6b77fde7b7758808f19')

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
