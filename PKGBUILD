# Maintainer: Scott Cheng <aur@chengscott.io>
pkgname=python-aitemplate-git
_name="${pkgname%%-git}"
pkgver=0.3.dev0.r676.gf7113563
pkgrel=1
pkgdesc='AITemplate is a Python framework which renders neural network into high performance CUDA/HIP C++ code.'
arch=(any)
provides=("${_name}")
conflicts=("${_name}")
url='https://github.com/facebookincubator/AITemplate'
license=('Apache')
depends=(
  python-jinja
  python-numpy
  python-sympy
)
makedepends=(
  git
  ninja
  python-build
  python-installer
  python-wheel
)
source=("${pkgname}"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags |
      python -c "import sys; \
                 v0, v1, v2, v3 = sys.stdin.read().replace('.', '-').split('-'); \
                 print(f'{v0}.{int(v1)+1}.dev0.r{v2}.{v3}', end='')"
}

prepare() {
  cd "${pkgname}"
  git clean -dfx
  git submodule update --init --recursive
}

build() {
  python -m build -nw "${pkgname}/python"
}

package() {
  python -m installer \
      --compile-bytecode 1 \
      --destdir "${pkgdir}" \
      "${pkgname}/python/dist/${_name#python-}-"*.whl
  install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_name}"
}
