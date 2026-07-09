# Maintainer: Deon Spengler <deon@spengler.co.za>

_name=PyFastNoiseLite
_pkg=pyfastnoiselite
# ext/FastNoise submodule commit pinned by the v0.0.7 tag
_fastnoise_commit=8c45924f086edcb93b8876eb351c07d5e982e47f
pkgname=python-pyfastnoiselite
pkgver=0.0.7
pkgrel=1
pkgdesc="Cython wrapper for Auburn's FastNoise Lite"
arch=('x86_64')
url="https://github.com/tizilogic/PyFastNoiseLite"
license=('MIT')
depends=('python' 'python-numpy' 'gcc-libs' 'glibc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cython')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "FastNoiseLite-$_fastnoise_commit.h::https://raw.githubusercontent.com/Auburn/FastNoise/$_fastnoise_commit/Cpp/FastNoiseLite.h")
sha256sums=('6f88d6a375d511d4d8954d44f71a9c72712cb9f8836eda04538f2eb59661011f'
            'ca72cb947b7cc558ea3a77fc837803f813890884aaf71e2b7ea6435440b9a814')

prepare() {
  # ext/FastNoise is a git submodule and is empty in the release tarball.
  # Drop the pinned header in so setup.py does not fetch it over the network.
  install -Dm644 "$srcdir/FastNoiseLite-$_fastnoise_commit.h" \
    "$srcdir/$_name-$pkgver/ext/FastNoise/Cpp/FastNoiseLite.h"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  local _pyver
  _pyver="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${_pyver/./}" python -c \
    'from pyfastnoiselite.pyfastnoiselite import FastNoiseLite, NoiseType
n = FastNoiseLite()
n.noise_type = NoiseType.NoiseType_OpenSimplex2
assert isinstance(n.get_noise(1.2, 3.4), float)'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Upstream vendored header keeps its own MIT notice
  install -Dm644 "$srcdir/FastNoiseLite-$_fastnoise_commit.h" \
    "$pkgdir/usr/share/licenses/$pkgname/FastNoiseLite.LICENSE.h"
}
