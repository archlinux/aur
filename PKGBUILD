# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_pkgname="${pkgname#python-}"
pkgver=0.23.1
pkgrel=3
pkgdesc="Library of Python tools and extensions for data science"
arch=(any)
url="https://github.com/rasbt/mlxtend"
license=(
  BSD-3-Clause
  CC-BY-SA-4.0
)
depends=(
  python
  python-joblib
  python-matplotlib
  python-nose
  python-numpy
  python-packaging
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
  "0001-dont-include-tests-in-built-wheel.patch"
)
sha256sums=(
  '879df9b029cfa09b60aaad53d0402613af1383821fc4dec01b6f50d044ded0d5'
  '637e2427259c859048f695ed725750852fdb16c38321e0d73038b84bcc294754'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # See: https://github.com/rasbt/mlxtend/pull/1076
  patch --forward --strip=1 --input="$srcdir/0001-dont-include-tests-in-built-wheel.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest mlxtend/ \
    --ignore mlxtend/evaluate/f_test.py \
    --deselect mlxtend/evaluate/tests/test_bias_variance_decomp.py::test_01_loss_bagging \
    --deselect mlxtend/evaluate/tests/test_bias_variance_decomp.py::test_mse_bagging \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_StackingClassifier \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_StackingClassifier_proba_avg_1 \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_StackingClassifier_proba_concat_1 \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_decision_function \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_use_features_in_secondary_predict \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_use_features_in_secondary_sparse_input_predict \
    --deselect mlxtend/classifier/tests/test_stacking_classifier.py::test_use_probas \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_StackingCVClassifier \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_StackingClassifier_proba \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_cross_validation_technique \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_decision_function \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_do_not_stratify \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_use_features_in_secondary \
    --deselect mlxtend/classifier/tests/test_stacking_cv_classifier.py::test_use_probas \
    --deselect mlxtend/preprocessing/tests/test_transactionencoder.py::test_inverse_transform \
    --deselect mlxtend/regressor/tests/test_stacking_cv_regression.py::test_gridsearch_replace_mix
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-BSD3.txt
}
