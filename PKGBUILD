# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsdpir
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.2.0.0.g99563fc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-dpir'
license=('MIT')
depends=(
  'vapoursynth-plugin-vsutil-git'
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
  'python-onnxruntime: ONNXRuntime support'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-dpir.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsdpir"
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
