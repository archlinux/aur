# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-wonderwords
_pkgname=wonderwords
_upstream=wonderwordsmodule
pkgver=3.0.1
pkgrel=1
pkgdesc='Generate random English words and sentences'
arch=('any')
url='https://github.com/mrmaxguns/wonderwordsmodule'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-rich'
)
optdepends=('python-rich: command-line interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65a5bfd85060e8982b13afa401500afb4116d3b89d519c79c34621fde6b799cd')

build() {
  cd "$_upstream-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python -m build --wheel --no-isolation
}

check() {
  local _checkroot="$srcdir/_check" _site _staged
  rm -rf "$_checkroot"
  python -m installer --destdir="$_checkroot" \
    "$_upstream-$pkgver"/dist/*.whl
  _site=$(python -c 'import site; print(site.getsitepackages()[0])')
  _staged="$_checkroot$_site"
  mkdir -p "$_checkroot/suite"
  cp -a "$_upstream-$pkgver/tests" "$_checkroot/suite/"

  cd "$_checkroot/suite"
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 PYTHONPATH="$_staged" \
    python -P -m pytest -ra --import-mode=importlib tests

  PYTHONPATH="$_staged" python -P - <<'PY'
from wonderwords import RandomSentence, RandomWord, __version__

assert __version__ == "3.0.1"
words = RandomWord().filter(starts_with="mana")
assert {"manage", "manager", "management"} <= set(words)
sentence = RandomSentence(
    nouns=["builder"], verbs=["test"], adjectives=["careful"]
).sentence()
assert sentence.endswith(".") and "builder" in sentence.lower()
print("Wonderwords staged API workflow passed")
PY
  PYTHONPATH="$_staged" python -P -m wonderwords --version | \
    grep -Fx "Wonderwords $pkgver"
}

package() {
  cd "$_upstream-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
