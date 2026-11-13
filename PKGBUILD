pkgname=python-indra-ocr
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
pkgdesc='Fast CPU OCR for PDFs and images using ONNX Runtime'
arch=(any)
url='https://github.com/datalab-to/indra'
license=(Apache-2.0)
depends=(
  python
  python-huggingface-hub
  python-numpy
  python-onnxruntime-cpu
  python-opencv
  python-pypdfium2
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=77'
)
checkdepends=(
  python-pytest
  python-pillow
  python-pikepdf
)
optdepends=(
  'python-pytesseract: compare OCR output with Tesseract in the web viewer'
  'tesseract: Tesseract executable for the optional viewer comparison'
)
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('405a40b8a62eb28d36cf96f236f2639286fbc791407733c16f93451dbe733914')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name//-/_}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="${PWD}/test-env/bin:${PATH}" \
    test-env/bin/python -P -m pytest
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
}
