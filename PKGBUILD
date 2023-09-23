# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name="${pkgname#python-}"
pkgver=0.23.0
pkgrel=1
pkgdesc="Library of Python tools and extensions for data science"
arch=(any)
url="https://github.com/rasbt/mlxtend"
license=(
  BSD
  CCPL
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
  python-pytest
  python-scikit-learn
  python-scipy
  python-tensorflow
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "remove-faulty-pyproject-section.patch"
)
sha256sums=(
  '12e184e76716835cc8acbac446252d47e301682f8801720f2bf465eaf9ea720f'
  'd42fbb12c81ef0ecc663e188f5b93ec3cda678e239c9583a64a5daf2cd0acf2c'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  sed -i 's/astype(np.int)/astype(np.int_)/g' mlxtend/evaluate/bias_variance_decomp.py
  sed -i 's/dtype=np.bool/dtype=np.bool_/g' mlxtend/evaluate/holdout.py
  sed -i 's/LinearRegression(normalize=True)/LinearRegression()/g' \
    mlxtend/regressor/tests/test_stacking_regression.py \
    mlxtend/regressor/tests/test_stacking_cv_regression.py

  patch --no-backup-if-mismatch --forward --strip=1 \
    --input=../remove-faulty-pyproject-section.patch
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -r build
  python -m pytest \
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
    --deselect mlxtend/evaluate/tests/test_holdout.py::test_predefinedholdoutsplit_default_iter \
    --deselect mlxtend/evaluate/tests/test_holdout.py::test_predefinedholdoutsplit_in_grid \
    --deselect mlxtend/evaluate/tests/test_holdout.py::test_predefinedholdoutsplit_in_sfs \
    --deselect mlxtend/preprocessing/tests/test_transactionencoder.py::test_inverse_transform
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 LICENSE-BSD3.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD3"
  install -Dm644 LICENSE-CC-BY.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CC-BY"
}
