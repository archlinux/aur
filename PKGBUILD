# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=python-compressed-tensors-git
_srcname=compressed-tensors-vllm
pkgver=0.20.1.r16.gd5f7e84
pkgrel=1
pkgdesc="versatile and efficient way to store and manage compressed tensor data"
arch=('any')
url='https://github.com/vllm-project/compressed-tensors'
license=(Apache-2.0)
provides=(python-compressed-tensors)
conflicts=(python-compressed-tensors)
depends=(python python-pytorch python-safetensors python-pydantic python-accelerate python-numpy python-tqdm python-transformers)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=("$_srcname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname" || return
  local description
  description=$(git describe --long --tags --abbrev=7) || return
  sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' <<< "$description"
}
prepare(){
  cd "$srcdir/$_srcname"
  sed -i -E 's|setuptools_scm[=<>]+[0-9.]+|setuptools_scm|' pyproject.toml
}
build() {
  cd "$srcdir/$_srcname"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$(echo "$pkgver" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+')
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_srcname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
