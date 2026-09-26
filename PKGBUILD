# Maintainer: Tobias Bachmann <tobachmann@gmx.de>

pkgname=python-trx
_name=trx_python
pkgver=0.6
pkgrel=1
_testdata=v0.1.0
pkgdesc="A community-oriented file format for tractography"
arch=('any')
url="https://github.com/tee-ar-ex/trx-python"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-deepdiff'
  'python-nibabel'
  'python-numpy'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-psutil'
  'python-pytest'
  'python-pytest-console-scripts'
)
optdepends=(
  'python-dipy: extra utilities and tractogram tools'
  'python-fury: overlap visualization (trx_visualize_overlap)'
)
_testurl="https://github.com/tee-ar-ex/trx-test-data/releases/download/$_testdata"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"trx-nibabel-test-helpers.py"
        "trx-test-data-$_testdata-DSI.zip::$_testurl/DSI.zip"
        "trx-test-data-$_testdata-gold_standard.zip::$_testurl/gold_standard.zip"
        "trx-test-data-$_testdata-memmap_test_data.zip::$_testurl/memmap_test_data.zip"
        "trx-test-data-$_testdata-trx_from_scratch.zip::$_testurl/trx_from_scratch.zip"
        "trx-nibabel-test-helpers.py")
noextract=("trx-test-data-$_testdata-DSI.zip"
           "trx-test-data-$_testdata-gold_standard.zip"
           "trx-test-data-$_testdata-memmap_test_data.zip"
           "trx-test-data-$_testdata-trx_from_scratch.zip")
sha256sums=('434d53ca9ba347680ff334124c5882668f322660c75aba480e88bdbba8de349f'
            '6ca47341cf643becf6b678dc272781ee8285c85f7a922c807171e25877890b67'
            '1b09ce8b4b47b2600336c558fdba7051218296e8440e737364f2c4b8ebae666c'
            '35a0b633560cc2b0d8ecda885aa72d06385499e0cd1ca11a956b0904c3358f01'
            '98ba89d7a9a7baa2d37956a0a591dce9bb4581bd01296ad5a596706ee90a52ef'
            'f98ab6da6a6065527fde4b0b6aa40f07583e925d952182e9bbd0febd55c0f6b2'
            '6ca47341cf643becf6b678dc272781ee8285c85f7a922c807171e25877890b67')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf test_dir
  python -m installer --destdir=test_dir dist/*.whl

  # Pre-seed the test data; upstream's fetcher skips downloads for existing files
  export TRX_HOME="$srcdir/trx-home"
  mkdir -p "$TRX_HOME"
  local _f
  for _f in DSI gold_standard memmap_test_data trx_from_scratch; do
    ln -sf "$srcdir/trx-test-data-$_testdata-$_f.zip" "$TRX_HOME/$_f.zip"
  done

  # test_memmap.py imports a helper from nibabel's test suite, which Arch's
  # python-nibabel doesn't ship; point it at a local copy instead
  mkdir -p "$srcdir/test-helpers"
  ln -sf "$srcdir/trx-nibabel-test-helpers.py" "$srcdir/test-helpers/nibabel_test_helpers.py"
  sed -i 's/^from nibabel\.streamlines\.tests\.test_tractogram import make_dummy_streamline$/from nibabel_test_helpers import make_dummy_streamline/' \
    "test_dir$_site/trx/tests/test_memmap.py"
  grep -q '^from nibabel_test_helpers import' "test_dir$_site/trx/tests/test_memmap.py"

  # CLI tests call the installed console scripts
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  export PYTHONPATH="$PWD/test_dir$_site:$srcdir/test-helpers"
  cd "test_dir$_site"
  python -m pytest -p no:cacheprovider trx/tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
