# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=1.2.2
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
sha256sums=('cf106221fdacf0eeed270b90aef27420c509dd69428f38ed5b0198945b7d62eb')

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
