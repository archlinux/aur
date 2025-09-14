# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Hugo Doria <hugodoria at gmail.com>

pkgname=translate-toolkit
pkgver=3.16.1
pkgrel=1
pkgdesc="A toolkit to convert between various different translation formats, help process and validate localisations"
arch=('any')
url="https://toolkit.translatehouse.org/"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'python'
  'python-cwcwidth'
  'python-lxml'
  'python-ruamel-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-cheroot'
  'python-mistletoe'
  'python-pyparsing'
  'python-pytest'
  'python-vobject'
)
optdepends=( 
  'gaupol: for po2sub'
  'python-chardet: encoding detector'
  'python-cheroot: for TM Server'
  'python-levenshtein: faster matching'
  'python-mistletoe: Markdown support for po2md'
  'python-pyenchant: for spellcheck filter'
  'python-pyparsing: RC support for po2rc'
  'python-vobject: iCalendar files support for po2ical'
)
source=("https://github.com/translate/translate/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f6721e1a1915f7e291a43e7da6de7261b8c93cf5cfad2cc23ccda05710b23abf')

build() {
  cd translate-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd translate-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest \
    --deselect tests/translate/storage/test_csvl10n.py::TestCSV::test_encoding_save \
    --deselect tests/translate/tools/test_help.py::test_help \
    --deselect tests/translate/tools/test_junitmsgfmt.py::test_output \
    --deselect tests/translate/tools/test_pocount.py::test_cases \
    --deselect tests/translate/tools/test_pocount.py::test_output \
    --ignore tests/translate/convert/test_ini2po.py \
    --ignore tests/translate/convert/test_php2po.py \
    --ignore tests/translate/convert/test_po2ini.py \
    --ignore tests/translate/convert/test_po2php.py \
    --ignore tests/translate/storage/test_cpo.py \
    --ignore tests/translate/storage/test_fluent.py \
    --ignore tests/translate/storage/test_ini.py \
    --ignore tests/translate/storage/test_php.py \
    --ignore tests/translate/storage/test_po.py \
    --ignore tests/translate/storage/test_pypo.py \
    --ignore tests/translate/storage/test_subtitles.py
}


package() {
  cd translate-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cp -a translate/share "$pkgdir/$site_packages/translate"
}
