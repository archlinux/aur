# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='Python Server API for LiveKit.'
arch=('any')
_repo='https://github.com/livekit/python-sdks'
url="$_repo/tree/main/$_name"
license=('Apache-2.0')
depends=('python'
         'python-pyjwt'
         'python-aiohttp'
         'python-idna'
         'python-multidict'
         'python-protobuf'
         'python-livekit-protocol')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/api-v$pkgver.tar.gz")
sha256sums=('a31236663cf6b6bb6731c42e49688d4c4a77afe51386c18579669dd614d8f6bf')

build() {
  cd "python-sdks-${_name//livekit-/}-v$pkgver"
  python -m build --wheel --no-isolation $_name
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "python-sdks-${_name//livekit-/}-v$pkgver"
  PYTHONPATH=$PWD/$_name pytest "${pytest_options[@]}" tests/${_name//livekit-/}
}

package() {
  cd "python-sdks-${_name//livekit-/}-v$pkgver"
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
