# Contributor: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video."
url="https://github.com/smacke/ffsubsync"
depends=(
    'python'
    'python-auditok'
    'python-cchardet'
    'python-chardet'
    'python-charset-normalizer'
    'python-faust-cchardet'
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
optdepends=(
    'python-pytorch: for the `--vad=fused` option'
    'mkvtoolnix-cli: for faster Matroska files subtitles extraction'
)
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "requirements-$pkgver.txt::https://raw.githubusercontent.com/smacke/ffsubsync/$pkgver/requirements.txt"
)
sha256sums=('91a57724d95839f2e861758852e320789fb003c4f8c3432b3ecd928d9df65eb5'
            '193e11f115731869738d14f280c6d97b190acb0c881e8691c01ebe6891fc7f7c')

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
