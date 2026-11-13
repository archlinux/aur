# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-marker-pdf
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
pkgdesc='Convert documents to markdown, JSON, chunks, and HTML quickly and accurately'
arch=(any)
url='https://github.com/datalab-to/marker'
license=(Apache-2.0)
depends=(
  'python>=3.10'
  'python-anthropic>=0.69.0'
  'python-beautifulsoup4'
  'python-click>=8.2.0'
  'python-dotenv>=1.0.0'
  'python-filetype>=1.2.0'
  'python-ftfy>=6.1.1'
  'python-google-genai>=1.40.0'
  'python-indra-ocr>=1.1.2'
  'python-markdown2>=2.5.2'
  'python-markdownify>=1.1.0'
  'python-openai>=2.2.0'
  'python-pdftext>=0.7.0'
  'python-pillow>=10.1.0'
  'python-psutil>=7.0.0'
  'python-pydantic>=2.4.2'
  'python-pydantic-settings>=2.0.3'
  'python-pypdfium2'
  'python-pytorch>=2.7.0'
  'python-rapidfuzz>=3.8.1'
  'python-regex>=2024.4.28'
  'python-requests'
  'python-scikit-learn>=1.6.1'
  'python-surya-ocr>=0.23.0'
  'python-tqdm>=4.66.1'
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  'python-pytest>=8.3.3'
  'python-pytest-mock>=3.14.0'
  'python-datasets>=2.21.0'
  'python-mammoth>=1.9.0'
  'python-openpyxl>=3.1.5'
  'python-pptx>=1.0.2'
  'python-ebooklib>=0.18'
  'python-weasyprint>=63.1'
  'python-fastapi>=0.115.4'
  'python-python-multipart>=0.0.16'
  'python-streamlit>=1.37.1'
  'uvicorn>=0.32.0'
)
optdepends=(
  'python-ebooklib>=0.18: EPUB input'
  'python-mammoth>=1.9.0: DOCX input'
  'python-openpyxl>=3.1.5: XLSX input'
  'python-pptx>=1.0.2: PPTX input'
  'python-weasyprint>=63.1: HTML input'

  'python-fastapi>=0.115.4: FastAPI API backend for marker_server and marker_gui'
  'python-python-multipart>=0.0.16: Multipart file uploads to the FastAPI server'
  'uvicorn>=0.32.0: ASGI server for the FastAPI backend'
  'python-streamlit>=1.37.1: Legacy Streamlit interface'

  'ollama: Local Ollama inference service for LLM-assisted conversion'

  'docker: Run the Surya vLLM inference backend in a container (NVIDIA GPU)'
  'llama-cpp: Local llama.cpp inference server (llama-server)'
  'nvidia-container-toolkit: NVIDIA GPU support for Docker-based vLLM inference'
)
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('5c37c9f527adea5440d45aa5ec2dac11a4439964e567cf8ed2a5415904cbe6c9')

build() {
  cd "${_name//-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name//-/_}-${pkgver}"

  touch tests/__init__.py

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="${PWD}/test-env/bin:${PATH}" \
    test-env/bin/python -P -m pytest
}

package() {
  cd "${_name//-/_}-${pkgver}"

  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
}
