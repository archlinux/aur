# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
_base=ludwig
pkgname=python-${_base}
pkgver=0.4
pkgrel=1
pkgdesc="Data-centric declarative deep learning framework"
arch=(any)
url="https://github.com/${_base}-ai/${_base}"
license=(MIT)
depends=(cython python-pandas python-tabulate python-scikit-learn python-yaml absl-py kaggle-api python-pytables python-fsspec python-dataclasses-json python-jsonschema) # python-tensorflow
# python-cloudpickle python-pytest python-spacy-en_core_web_sm
# checkdepends=(python-pytest-timeout python-wandb python-mlflow)
optdepends=('ludwig-example: example use of Ludwig'
  'python-soundfile'
  'python-torchaudio'
  'python-scikit-image'
  'python-torchvision'
  'python-transformers'
  'uvicorn'
  'python-fastapi'
  'python-multipart'
  'python-imageio'
  'python-spacy'
  'python-seaborn'
  'python-horovod'
  'python-dask'
  'python-pyarrow'
  'python-ray'
  'python-tensorboardx'
  'python-gputil'
  'python-tblib'
  'aws-cli'
  'python-hyperopt')
# neuropod python-sentencepiece python-hiplot python-petastorm python-pickle5 python-bayesmark python-pysot
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('dfb8100d726fd1ea6f3c472e805cc1e8ea7b272d62478280fded69ed45a5bfb2488f51088fa27bd2845fb8af8a219df305b2a5f742958b177fa972862bb03ae1')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # fix issue where spacy >= 2.0 is not detected
  # find "$pkgdir" -name requires.txt -type f -exec sed -i '/spacy/d' {} \;
}
