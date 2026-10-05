# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-surya-ocr
_name=${pkgname#python-}
pkgver=0.22.1
pkgrel=1
pkgdesc='OCR, layout analysis, reading order, and table recognition in 90+ languages'
arch=('any')
url='https://github.com/datalab-to/surya'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-beautifulsoup4>=4.12.0'
  'python-click>=8.1.8'
  'python-dotenv>=1.0.0'
  'python-filelock>=3.16.0'
  'python-filetype>=1.2.0'
  'python-httpx>=0.27.0'
  'python-huggingface-hub>=1.5.0'
  'python-numpy'
  'python-openai>=1.55.0'
  'python-opencv'
  'python-pillow>=10.2.0'
  'python-platformdirs>=4.3.6'
  'python-pydantic>=2.5.3'
  'python-pydantic-settings>=2.1.0'
  'python-pypdfium2>=5.10.1'
  'python-pytorch>=2.7.0'
  'python-requests>=2.28.0'
  'python-torchvision>=0.20.0'
  'python-tqdm'
  'python-transformers>=5.12.1'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'docker: for the NVIDIA/vLLM inference backend'
  'llama-cpp: for the local llama-server inference backend'
  'python-flask: for the surya_screenshot web application'
  'python-pdftext: for bad-PDF-text detection in surya_gui'
  'python-streamlit: for the surya_gui Streamlit application'
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('792fc63d18cf648ed3608a3d0e3ed06ae627a31b08a8501d601bda4763ba6f9c')

prepare() {
  # Fix extracted directory name
  mv "${_name//-/_}-${pkgver}" "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

# Tests are currently broken, because package requires python-huggingface-hub<2.0,
# while ArchLinux provides python-huggingface-hub=2.1.1. Build with --nocheck.
check() {
  cd "${_name}-${pkgver}"
  pytest
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
