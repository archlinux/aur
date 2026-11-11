# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-whisper-normalizer
pkgver=1.0.1
pkgrel=1
pkgdesc='Multilingual text normalization for speech recognition and synthesis'
arch=(any)
url='https://github.com/kurianbenoy/whisper_normalizer'
license=(MIT)
depends=('python>=3.11' python-more-itertools python-regex python-indic-numtowords python-text2num)
makedepends=(python-build python-installer 'python-setuptools>=64' python-wheel)
checkdepends=(python-num2words)
optdepends=('python-num2words: spell out numbers in text-to-speech mode')
_commit=7fb49b0d5d5a1beae01ea3561d318c157ba9ab1c
source=("whisper-normalizer-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        check-notebooks.py)
sha256sums=('dde552111e24b85376829bddf0865f6d19213fcd96f5aad46f2df585e78732eb'
            'b9df1508f202a9316e0bcda8c80d137a355ebbab979e69f142af62d1654620a3')

prepare() {
  cd "whisper_normalizer-$_commit"
  # The spelling normalizer loads this table through importlib.resources.
  cat >> pyproject.toml <<'PYPROJECT'

[tool.setuptools.package-data]
whisper_normalizer = ["normalizers/*.json"]
PYPROJECT
}

build() {
  cd "whisper_normalizer-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "whisper_normalizer-$_commit"
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  # Run upstream notebook assertions with the built modules. Only nbdev
  # documentation/export cells are omitted, including notebook index rendering.
  PYTHONPATH="${site_packages[0]}" python -P "$srcdir/check-notebooks.py"
}

package() {
  cd "whisper_normalizer-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
