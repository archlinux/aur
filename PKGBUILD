# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name="${pkgname#python-}"
pkgver=0.22.0
pkgrel=1
pkgdesc="Library of Python tools and extensions for data science"
arch=(any)
url="https://github.com/rasbt/mlxtend"
license=(
  BSD
  CCPL
)
depends=(
  python-dlib
  python-imageio
  python-joblib
  python-matplotlib
  python-nose
  python-numpy
  python-pandas
  python-psutil
  python-scikit-learn
  python-scipy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-tensorflow
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'fd5af356f0e58e763cc708e2fb94fdbd73b8746e9919b4066ef927116927d17a'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  sed -i 's/astype(np.int)/astype(np.int_)/g' mlxtend/evaluate/bias_variance_decomp.py
  sed -i 's/dtype=np.bool/dtype=np.bool_/g' mlxtend/evaluate/holdout.py
  sed -i 's/LinearRegression(normalize=True)/LinearRegression()/g' \
    mlxtend/regressor/tests/test_stacking_regression.py \
    mlxtend/regressor/tests/test_stacking_cv_regression.py
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    --ignore mlxtend/feature_selection/tests/test_sequential_feature_selector_feature_groups.py \
    --ignore mlxtend/evaluate/f_test.py \
    --ignore mlxtend/feature_selection/tests/test_exhaustive_feature_selector.py \
    --ignore mlxtend/feature_selection/tests/test_sequential_feature_selector.py \
    --deselect mlxtend/feature_selection/tests/test_column_selector.py::test_ColumnSelector_with_dataframe \
    --deselect mlxtend/feature_selection/tests/test_column_selector.py::test_ColumnSelector_with_dataframe_and_int_columns \
    --deselect mlxtend/feature_selection/tests/test_column_selector.py::test_ColumnSelector_with_dataframe_drop_axis \
    --deselect mlxtend/feature_selection/tests/test_column_selector.py::test_ColumnSelector_with_dataframe_in_gridsearch \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestErrors::test_sparsedataframe_notzero_column \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestApriori::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestApriori::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestAprioriLowMemory::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestAprioriLowMemory::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestAprioriBoolInput::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestAprioriBoolInput::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_apriori.py::TestEx2::test_output \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestErrors::test_sparsedataframe_notzero_column \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestEx1::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestEx1::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestEx1BoolInput::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestEx1BoolInput::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_fpgrowth.py::TestEx2::test_output \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestErrors::test_sparsedataframe_notzero_column \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx1::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx1::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx1BoolInput::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx1BoolInput::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx2::test_output \
    --deselect mlxtend/frequent_patterns/tests/test_fpmax.py::TestEx4::test_output \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestErrors::test_sparsedataframe_notzero_column \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestHmine::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestHmine::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestHmineBoolInput::test_default \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestHmineBoolInput::test_sparse_with_zero \
    --deselect mlxtend/frequent_patterns/tests/test_hmine.py::TestEx2::test_output \
    --deselect mlxtend/preprocessing/tests/test_transactionencoder.py::test_inverse_transform
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 LICENSE-BSD3.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD3"
  install -Dm644 LICENSE-CC-BY.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CC-BY"
}
