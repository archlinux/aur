# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-indic-numtowords
pkgver=1.0.2
pkgrel=1
pkgdesc='Convert numbers to words in Indian languages and English'
arch=(any)
url='https://github.com/AI4Bharat/indic-numtowords'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
_commit=8ab6d4472ffd5be34b1bd6a2acfec9b669f51ef0
source=("indic-numtowords-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('448f8b029a398e96f158ce829a22ec227bd677167352d3d470658d7be52b6c40')

prepare() {
  cd "indic-numtowords-$_commit"
  # The documented integer split=True path incorrectly iterates an integer.
  python - <<'PYPREP'
from pathlib import Path
path = Path("indic_numtowords/numtowords.py")
text = path.read_text()
for old, new in [
    ("for digit in number)", "for digit in str(number))"),
    ("for digit in (number if split else number_str)",
     "for digit in (str(number) if split else number_str)"),
]:
    assert text.count(old) == 1
    text = text.replace(old, new)
path.write_text(text)
PYPREP
}

build() {
  cd "indic-numtowords-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "indic-numtowords-$_commit"
  # Upstream ships no automated suite. Verify its three README examples.
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  cd "$srcdir"
  PYTHONPATH="${site_packages[0]}" python - <<'PYTEST'
from indic_numtowords import num2words
assert num2words(38, lang='ta') == 'முப்பத்து எட்டு'
assert num2words(150, lang='hi', variations=True) == ['एक सौ पचास', 'डेढ़ सौ']
assert num2words(420, lang='doi', split=True) == 'चार दो सिफर'
for language in ['hi', 'doi']:
    assert num2words(420, lang=language, split=True) == num2words('420', lang=language, split=True)
    assert num2words(1234567890, lang=language) == num2words('1234567890', lang=language)
print('Upstream README examples and integer digit conversion: PASS')
PYTEST
}

package() {
  cd "indic-numtowords-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
