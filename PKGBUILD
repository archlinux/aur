# Contributor: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.4.29
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video."
url="https://github.com/smacke/ffsubsync"
depends=(
    'python'
    'python-auditok'
    'python-cchardet'
    'python-chardet'
    'python-charset-normalizer'
    'python-ffmpeg-python'
    'python-numpy'
    'python-pysubs2'
    'python-rich'
    'python-srt'
    'python-tqdm'
    'python-typing_extensions'
    'python-webrtcvad'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-pytest'
    'python-setuptools'
    'python-versioneer'
    'python-wheel'
)
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "requirements-$pkgver.txt::https://raw.githubusercontent.com/smacke/ffsubsync/$pkgver/requirements.txt"
)
sha256sums=('ca0d641e6dd20e6ac5a1d622f5877b0b9c2a489034de822ff168fd5af29edcd6'
            '69ae73f24b22ba99e4a542fccead2826f6c027c4c269cf19829875391a45dff4')

build() {
  cd "$_name-$pkgver"
  rm versioneer.py
  cp "../requirements-$pkgver.txt" requirements.txt
  pyproject-build --no-isolation --skip-dependency-check --wheel
}

check() {
  cd "$_name-$pkgver"
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
}
