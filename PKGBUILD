# Contributor: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.4.26
pkgrel=2
pkgdesc="Language-agnostic automatic synchronization of subtitles with video."
url="https://github.com/smacke/ffsubsync"
depends=(
    'python'
    'python-auditok'
    'python-build'
    'python-cchardet'
    'python-chardet'
    'python-charset-normalizer'
    'python-ffmpeg-python'
    'python-installer'
    'python-numpy'
    'python-pysubs2'
    'python-pytest'
    'python-rich'
    'python-six'
    'python-srt'
    'python-tqdm'
    'python-typing_extensions'
    'python-versioneer'
    'python-webrtcvad'
    'python-wheel'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/smacke/ffsubsync/$pkgver/requirements.txt"
)
sha256sums=('1ac03a832edba9da88ceeed753e2daaa4e620b632fd7949710cb31516b611410'
            'd05e473790aec4a98a15275639d7abc0d5d52d95b89c0c0788afe5444ac77d33')

build() {
  cd "$_name-$pkgver"
  rm versioneer.py
  cp ../requirements.txt .
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
