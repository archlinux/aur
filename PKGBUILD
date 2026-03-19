# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-sgl-kernel-git
_pkgname=sgl-kernel
_reponame=sglang
pkgver=r10744.4c52b7fcc6
pkgrel=1
pkgdesc='Compiled CUDA kernels for the SGLang serving framework'
arch=('x86_64')
url='https://github.com/sgl-project/sglang/tree/main/sgl-kernel'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-pytorch'
  'cuda'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-scikit-build-core'
  'python-pytorch'
  'python-sympy'
  'cmake'
  'ninja'
  'git'
)
provides=('python-sgl-kernel')
conflicts=('python-sgl-kernel')
options=('!strip')
source=("${_reponame}::git+https://github.com/sgl-project/sglang.git"
        'remove-thc-atomics.patch')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${_reponame}"
  patch -p1 < "${srcdir}/remove-thc-atomics.patch"
}

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_reponame}/${_pkgname}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$(cd .. && git tag -l 'v[0-9]*' --sort=-v:refname | head -1 | sed 's/^v//')"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export CMAKE_ARGS="${CMAKE_ARGS:--DSGL_KERNEL_COMPILE_THREADS=1}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_reponame}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
