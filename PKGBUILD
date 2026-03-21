# Contributor: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.4.31
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
sha256sums=('9a01f79bc1243b8a55242dfb7832d0a93314e386f70062b99ca33ac6440f92c7'
            '51dee65f54e6cb5692f5a9c1cd962dc1ac1243fc03db0bd9305a0ee4eb8af06d')

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
