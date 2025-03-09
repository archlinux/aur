# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsswinir
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0.0.0.g1db5305
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-swinir'
license=('Apache')
depends=(
  'vapoursynth'
  'python-numpy'
  'python-tqdm'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'python-hatchling'
)
optdepends=(
  'python-pytorch: CPU'
  'python-pytorch-cuda: CPU and CUDA'
  'python-pytorch-opt: CPU with AVX2 CPU optimizations)'
  'python-pytorch-opt-cuda: GPU CUDA and AVX2 CPU optimizations'
  'python-pytorch-opt-rocm: GPU ROCm and AVX2 CPU optimizations'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-swinir.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsswinir"
  python __main__.py
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
