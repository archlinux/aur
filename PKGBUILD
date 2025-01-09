# Maintainer: envolution
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=llama-cpp-python
pkgname=python-llama-cpp
pkgver=0.3.6
pkgrel=3
pkgdesc="Python bindings for llama.cpp"
arch=(any)
options=(!debug)
url=https://github.com/abetlen/llama-cpp-python
license=(GPL-3.0-or-later)
depends=(
  python-typing_extensions 
  python-numpy 
  python-diskcache 
)
optdepends=(
  uvicorn # python-uvicorn
  python-fastapi
  python-pydantic-settings
  python-sse-starlette
  python-pyaml
)
makedepends=(
  python-scikit-build
  python-installer
  python-build
  python-wheel
  python-scikit-build-core
)
checkdepends=(
  python-pytest
  python-huggingface-hub
  python-scipy
  python-httpx
  python-fastapi
  python-sse-starlette
  #python-sse-starlette-context #missing but tests don't seem to require it
  python-pydantic-settings
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('86e35a8888274466958e24201b856cd71c8def0ea72e14312be13da96c15c7a4')

_srcdir="llama_cpp_python-${pkgver}"
build() {
  cd $_srcdir
  export PREFIX=/usr
  python -m build --wheel --no-isolation
}

check() {
  cd $_srcdir
  python -m pytest
} 

package() {
  local _sys_site=$(python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])")
  cd $_srcdir
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -r "$pkgdir/$_sys_site"/{lib,bin,include}
}

# vim:set ts=2 sw=2 et:
