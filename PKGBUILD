# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-indic-numtowords
pkgver=1.1.0
pkgrel=1
pkgdesc='Convert numbers to words in Indian languages and English'
arch=(any)
url='https://github.com/AI4Bharat/indic-numtowords'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
_commit=0cde4eba5263b8f1cef783c06744b51f9fa2d618
source=("indic-numtowords-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('13df886bd2c4182231bf68b9c4dba0dd81ffc6c297f117c7dca7feab0915333c')

prepare() {
  cd "indic-numtowords-$_commit"
  # The documented integer split=True path incorrectly iterates an integer.
  python - <<'PYPREP'
from pathlib import Path
# All 129 runtime Python files match the published 1.1.0 source release.
# Upstream changed only setup.py's release version outside its Git history.
setup = Path("setup.py")
metadata = setup.read_text()
assert metadata.count("version='1.0.1'") == 1
setup.write_text(metadata.replace("version='1.0.1'", "version='1.1.0'"))
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
  INDIC_STAGED_ROOT="$srcdir/check" PYTHONPATH="${site_packages[0]}" python -P - <<'PYTEST'
import os
from pathlib import Path
from importlib.metadata import version
import indic_numtowords
from indic_numtowords import num2words
assert Path(indic_numtowords.__file__).resolve().is_relative_to(Path(os.environ["INDIC_STAGED_ROOT"]).resolve())
assert version("indic-numtowords") == "1.1.0"
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
