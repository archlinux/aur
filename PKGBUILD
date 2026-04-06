# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=python-compressed-tensors-git
_pkgname=compressed-tensors
pkgver=0.14.0.r29.g91db5d7
pkgrel=1
pkgdesc="versatile and efficient way to store and manage compressed tensor data"
arch=('any')
url='https://github.com/neuralmagic/compressed-tensors'
license=(Apache-2.0)
provides=(python-compressed-tensors)
conflicts=(python-compressed-tensors)
depends=(python python-pytorch python-safetensors python-pydantic python-accelerate python-numpy python-tqdm python-transformers)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=("git+https://github.com/neuralmagic/compressed-tensors")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}
prepare(){
  cd "$srcdir/${_pkgname}"
  sed -i -E 's|setuptools_scm[=<>]+[0-9.]+|setuptools_scm|' pyproject.toml
}
build() {
  cd "$srcdir/${_pkgname}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$(echo "$pkgver" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+')
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
