# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-surya-ocr
_name=${pkgname#python-}
pkgver=0.24.0
pkgrel=1
pkgdesc='OCR, layout analysis, reading order, and table recognition in 90+ languages'
arch=(any)
url='https://github.com/datalab-to/surya'
license=(Apache-2.0)
depends=(
  'python>=3.10'
  'python-beautifulsoup4>=4.12.0'
  'python-click>=8.1.8'
  'python-dotenv>=1.0.0'
  'python-filelock>=3.16.0'
  'python-filetype>=1.2.0'
  'python-httpx>=0.27.0'
  'python-huggingface-hub>=0.34.0'
  'python-numpy>=1.26.0'
  'python-openai>=1.55.0'
  'python-pillow>=10.2.0'
  'python-platformdirs>=4.3.6'
  'python-pydantic>=2.5.3'
  'python-pydantic-settings>=2.1.0'
  'python-pypdfium2>=4.18.0'
  'python-tqdm>=4.66.0'
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  git
  python-pytest
)
optdepends=(
  'docker: for running the NVIDIA/vLLM inference backend'
  'podman: alternative container runtime for the NVIDIA/vLLM inference backend'
  'nvidia-container-toolkit: for exposing NVIDIA GPUs to the vLLM container'
  'llama-cpp: for local inference through llama-server'
  'python-pytorch>=2.4.0: for the optional GGUF/MLX model-building utilities'
  'python-transformers>=4.45.0: for the optional GGUF/MLX model-building utilities'
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('cb3bc7575a442c447aa22d05fcc5233ee91b4a4bbbce7612c8da78bd90aef425')

prepare() {
  # Fix extracted directory name
  mv "${_name//-/_}-${pkgver}" "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  pytest
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
